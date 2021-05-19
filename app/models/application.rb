class Application < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates_presence_of :status,
                        :description
  validates :pet_id, uniqueness: { scope: :user_id }

  enum status: [:pending, :interested, :denied]
end
