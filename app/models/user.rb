class User < ApplicationRecord
  has_many :pets
  has_many :favorites
  has_many :applications

  validates :username, uniqueness: true, presence: true

  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }

end
