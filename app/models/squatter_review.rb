class SquatterReview < ApplicationRecord
  belongs_to :reviewee, class_name: 'Squatter', foreign_key: :reviewee_id
  belongs_to :reviewer, class_name: 'Squatter', foreign_key: :reviewer_id

  validates :summary, length: { maximum: 140 }
  validates_presence_of :reviewee, :reviewer, :body
end
