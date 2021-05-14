class Application < ApplicationRecord
  belongs_to :user
  belongs_to :pet

  validates_presence_of :status,
                        :description

  enum status: [:pending, :interested, :denied]
end
