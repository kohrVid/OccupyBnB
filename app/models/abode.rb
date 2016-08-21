require 'elasticsearch/model'
class Abode < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
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
      indexes :coordinates, type: "geo_point", "lat_lon": true
    end
  end
  
  def coordinates
    "#{latitude}, #{longitude}"
  end
  
  def self.search(query)
    __elasticsearch__.search(
      {
	track_scores: true,
	query: {
	  match_all: {}
	},
=begin
	"sort" => {
	  "_geo_distance" => {
	    "distance" => "distance".to_i,
	    coordinates: {
	    lat: "squatter_lat".to_f,
	    lon: "squatter_lon".to_f
	    },
	    'order': 'asc',
	    'unit': 'km'
	  }
	}
=end
    })
  end
end
Abode.import(force: true)
