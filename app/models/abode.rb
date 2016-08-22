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
  

  settings index: { number_of_shards: 1 } do
    mappings do
      indexes :id, type: "integer", index: :not_analyzed
      indexes :coordinates, type: "geo_point"
      indexes :approved, type: "boolean"
      indexes :residential, type: "boolean"
    end
  end

  def as_indexed_json(_options = {})
    as_json(only: %w(location))
    .merge(coordinates: {
      lat: latitude.to_f, lon: longitude.to_f
    })
  end

  #def self.search(query = nil, options = {})
  def self.search(query)
   # options ||= {}

    # empty search not allowed, for now
#    return nil if query.blank?# && options.blank?

    # define search definition
    search_definition = {
      query: {
#	match: { term: {approved: true} },
        bool: {
          must: []
        }
#	filtered:{filter: {bool: {must: [{term: {approved: true}}]}}}
      }
    }

    # geo spatial
    if query['squatter_lat'].present? && query['squatter_lon'].present?
      query[:distance] ||= 100

      search_definition[:query][:bool][:must] << {
        filtered: {
          filter: {
            geo_distance: {
              distance: "#{query[:distance]}km",
              coordinates: {
                lat: query['squatter_lat'].to_f,
                lon: query['squatter_lon'].to_f
              }
            }
          }
        }
      }
    end
=begin
    if query['residential_only'].present?
  #   search_definition[:query][:bool][:should] ||= [] 
      search_definition[:query][:bool][:must] << {
 #       filtered: {
 #         filter: {
#	    bool: {
#	      must: {
		and: [{
		  term: {
		    residential: query['residential_only']
		  }
		}]
#	      }
#	    }
#	  }
#	}
      }
    end
=end

    __elasticsearch__.search(search_definition)
  end 
end
Abode.import(force: true)
