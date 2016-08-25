class AbodeReview < ApplicationRecord
  belongs_to :abode
  belongs_to :squatter

  validates :summary, length: { maximum: 140 }
  validates_presence_of :abode, :squatter, :body
end
