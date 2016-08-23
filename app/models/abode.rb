require 'elasticsearch/model'
class Abode < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Elasticsearch::Model::Indexing
  belongs_to :submitted_by, class_name: "Squatter", 
	      foreign_key: :submitted_by_id
  belongs_to :approved_by, class_name: "Admin", foreign_key: :approved_by_id
  has_many :abode_images, dependent: :destroy
  accepts_nested_attributes_for :abode_images
  geocoded_by :location
  after_validation :geocode
  searchkick

  scope :approved, -> { where(approved: true) }

  validates :title, presence: true, length: { maximum: 30 }
  validates :location, presence: true
  validates :submitted_by, presence: true
  validates :sleeps_number, presence: :true
  

  settings index: { number_of_shards: 1 } do
    mappings dynamic: 'false' do
      indexes :id, type: "integer", index: :not_analyzed
      indexes :coordinates, type: "geo_point"
      indexes :approved, type: "boolean", index: :not_analyzed
      indexes :residential, type: "boolean", index: :not_analyzed
      indexes :sleeps_number, type: "integer", index: :not_analyzed
    end
  end

  def as_indexed_json(_options = {})
    as_json(only: %w(coordinates))
    .merge(coordinates: {
      lat: latitude.to_f, lon: longitude.to_f
    }).merge(residential: residential.to_s, sleeps_number: sleeps_number.to_s)
  end

  def self.search(query)

    return nil if query.blank?

    search_definition = {
      query: {
        bool: {
	  must: []
        }
      }
    }

    unless query['distance'].to_i.zero?
      search_definition[:query][:bool][:must] << {
        filtered: {
          filter: {
            geo_distance: {
              distance: "#{query['distance']}km",
              coordinates: {
                lat: query['squatter_lat'].to_f,
                lon: query['squatter_lon'].to_f
              }
            }
          }
        }
      }
    end
    
    if query['residential_only'].present?
      search_definition[:query][:bool][:must] << {
        filtered: {
          filter: {
	    and: [{
	      term: {
		residential: "#{query['residential_only']}"
	      }
	    }]
	  }
	}
      }
    end

    if query['non_residential_only'].present?
      search_definition[:query][:bool][:must] << {
        filtered: {
          filter: {
	    and: [{
	      term: {
		residential: "#{!query['non_residential_only']}"
	      }
	    }]
	  }
	}
      }
    end
    
    unless query['sleeps_number'].to_i.zero?
      search_definition[:query][:bool][:must] << {
        filtered: {
          filter: {
	    and: [{
	      term: {
		sleeps_number: "#{query['sleeps_number']}"
	      }
	    }]
	  }
	}
      }
    end

    __elasticsearch__.search(search_definition).records
  end 
end
Abode.import(force: true)
