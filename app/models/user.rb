class User < ApplicationRecord
  has_many :pets
  has_many :favorites
  has_many :applications
end
