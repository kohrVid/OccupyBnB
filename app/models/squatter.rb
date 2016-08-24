require 'elasticsearch/model'
class Squatter < ApplicationRecord
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  include Elasticsearch::Model::Indexing
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
	 :confirmable, :omniauthable, omniauth_providers: [:facebook, :twitter, :instagram]
  has_many :identities, dependent: :destroy
  has_many :submitted_abodes, class_name: "Abode", foreign_key: :submitted_by_id
  has_many :received_messages, class_name: 'Message', foreign_key: :recipient_id
  has_many :sent_messages, class_name: 'Message', foreign_key: :sender_id

  geocoded_by :location
  after_validation :geocode
  searchkick
  
  VALID_EMAIL_REGEX = /\A[^\.]+[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
  validates :username, presence: true, uniqueness: true
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  
  def self.find_for_oauth(auth, signed_in_resource = nil)
    identity = Identity.find_for_oauth(auth)
    squatter = signed_in_resource ? signed_in_resource : identity.squatter

    if squatter.nil?
      email_is_verified = auth.info.email && (auth.info.verified || auth.info.verified_email)
      email = auth.info.email if email_is_verified
      squatter = Squatter.where(email: email).first if email
      if squatter.nil?
	squatter = Squatter.new(
	  name: auth.extra.raw_info.name,
	  email: email ? email : "#{@email}-#{auth.uid}-#{auth.provider}",
	  password: Devise.friendly_token[0,20]
	)
	squatter.skip_confirmation!
	squatter.save!
      end
    end

    if identity.squatter != squatter
      identity.squatter = squatter
      identity.save!
    end
    squatter
  end

  def email_verified?
    self.email && self.email !~ @email
  end

  def admin?
    self.type == "Admin"
  end
  
  settings index: { number_of_shards: 1 } do
    mappings dynamic: "false" do
      indexes :id, type: "integer", index: :not_analyzed
      indexes :username, analyzer: "english", index_options: "offsets", index: :not_analyzed
    end
  end

  def as_indexed_json(_options = {})
    as_json(only: %w(id))
    .merge(username: username )
  end

  def self.search(query)
    search_definition = {
      query: {
        filtered: {
	  query: {
	    match_all: {}
	  },
	  filter: {
	    bool: {
	      should: [{
		query: {
		  wildcard: { 
		    username: { 
		      value: "*#{query}*"
		    }
		  }
		}
	      }]
	    }
	  }
        }
      }
    }
    __elasticsearch__.search(search_definition).records
  end


end
Squatter.import(force: true)
