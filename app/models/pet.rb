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

  def self.pet_search(search_term)
    enum = enum_eval(search_term)
    if enum
      Pet.where("pet_type = ?", enum)
    else
      false
    end
  end

  def self.enum_eval(search_term)
    search_term = check_plural?(search_term) if !search_term.nil?
    if search_term == "other"
      0
    elsif search_term == "dog"
      1
    elsif search_term == "cat"
      2
    else
      false
    end
  end

  def self.check_plural?(search_term)
    if search_term.downcase[-1] == 's'
      search_term = search_term[0..-2].downcase
    else
      search_term = search_term.downcase
    end
  end
end
