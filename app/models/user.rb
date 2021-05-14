class User < ApplicationRecord
  has_many :pets
  has_many :favorites
  has_many :applications

  validates_presence_of :username

  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

end
