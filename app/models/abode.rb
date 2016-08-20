class Abode < ApplicationRecord
  belongs_to :submitted_by, class_name: "Squatter", 
	      foreign_key: :submitted_by_id
  belongs_to :approved_by, class_name: "Admin", foreign_key: :approved_by_id
  has_many :abode_images, dependent: :destroy
  accepts_nested_attributes_for :abode_images
  geocoded_by :location
  after_validation :geocode
  scope :approved, -> { where(approved: true) }

  validates :title, presence: true, length: { maximum: 30 }
  validates :location, presence: true
  validates :submitted_by, presence: true

end
