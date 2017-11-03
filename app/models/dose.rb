class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :description, presence: true
  validates :cocktail, uniqueness: {scope: :ingredient_id, message: "should have only one dose of ingredient per cocktail" }
end
