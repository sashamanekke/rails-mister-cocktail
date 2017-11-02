class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  validates :cocktail, uniqueness: {scope: :ingredient, message: "should have only one dose of ingredient per cocktail" }
end
