class Identity < ApplicationRecord
  belongs_to :squatter
  
  validates :provider, presence: true
  validates :uid, presence: true

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
end
