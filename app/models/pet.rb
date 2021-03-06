class Pet < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :applications

  validates_presence_of :name,
                        :pet_type,
                        :description,
                        :gender,
                        :photo_url_1

  validates :age, presence: true, numericality: {
            greater_than_or_equal_to: 0
          }

  enum pet_type: [:other, :dog, :cat]

  def self.search(search_term)
    enum = assign_enum(search_term)
    if enum
      Pet.where("pet_type = ?", enum)
    end
  end

  def self.assign_enum(search_term)
    search_term = check_plural?(search_term) if search_term.present?
    if search_term == "other"
      0
    elsif search_term == "dog"
      1
    elsif search_term == "cat"
      2
    end
  end

  def self.check_plural?(search_term='')
    search_term = search_term.to_s.downcase
    if search_term[-1] == 's'
      search_term = search_term[0..-2]
    else
      search_term 
    end
  end
end
