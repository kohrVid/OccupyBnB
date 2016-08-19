class Squatter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
	 :confirmable, :omniauthable, omniauth_providers: [:facebook, :twitter, :instagram]
  has_many :identities, dependent: :destroy
  has_many :submitted_abodes, class_name: "Abode", foreign_key: :submitted_by_id
  
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
end
