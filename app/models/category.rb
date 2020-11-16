class Category < ApplicationRecord
  # model association
  has_many :ideas, dependent: :destroy

  # validations
  validates_presence_of :name
end
