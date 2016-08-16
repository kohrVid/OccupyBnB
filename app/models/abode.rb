class Abode < ApplicationRecord
  scope :approved, -> { where(approved: true) }
end
