class Squatter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
	 :confirmable, :lockable, :omniauthable
  
  VALID_EMAIL_REGEX = /\A[^\.]+[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i 
  validates :username, presence: true, uniqueness: true
  validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }

end
