class Idea < ApplicationRecord
  # model association
  belongs_to :Category

  # validations
  validates_presence_of :body, :Category_id
end
