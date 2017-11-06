# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Ingredient.create(name: "lemon")
Ingredient.create(name: "ice")
Ingredient.create(name: "mint leaves")

require "json"
require "open-uri"


url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
file_serialized = open(url).read
fruits = JSON.parse(file_serialized)

fruits["drinks"].each do |fruit|
  Ingredient.create(name: fruit["strIngredient1"])
end

