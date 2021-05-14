class Pet < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :applications

  validates_presence_of :name,
                        :type,
                        :description,
                        :gender,
                        :photo_url_1

  validates :age, presence: true, numericality: {
            greater_than_or_equal_to: 0
          }

  enum type: [:other, :dog, :cat]
end
