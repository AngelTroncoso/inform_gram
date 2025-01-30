# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


require 'faker'

# Crear categorías
10.times do
  Category.create!(name: Faker::Commerce.department)
end

# Crear ubicaciones
10.times do
  Location.create!(name: Faker::Address.city)
end

5.times do
  User = User.create!(
    email: Faker::Internet.email,
    password: 'password123',
    password_confirmation: 'password123')
end

users = User.all
locations = Location.all
categories = Category.all

100.times do
  article = Article.create!(
    title: Faker::Book.title,
    content: Faker::Lorem.paragraphs(sentence_count: 10),
    location: locations.sample,
    user: users.sample,
    available: [ true, false ].sample)


  article.categories << categories.sample(rand(1..3))
end
