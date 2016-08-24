class Message < ApplicationRecord
  belongs_to :sender, class_name: 'Squatter', foreign_key: :sender_id
  belongs_to :recipient, class_name: 'Squatter', foreign_key: :recipient_id
  belongs_to :replied_to, class_name: 'Message', foreign_key: :replied_to_id

  has_many :replies, class_name: 'Message', foreign_key: :replied_to_id

  validates_presence_of :recipient_id, :sender_id, :body
  validates :title, length: { maximum: 40 }

  scope :replies, -> { where(replied_to_id: !nil) }

  def history 
    history = []
    message = self
    while((message = message.replies) != [])
      history << message
    end
    history
  end
  
end
