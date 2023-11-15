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

Faker::Config.locale = 'fr'

puts 'Creating 5 fake restaurants...'
5.times do
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    category: %w[chinese italian japanese french belgian].sample,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code
  )
  restaurant.save!
end

puts 'Creating fake reviews...'
Restaurant.all.each do |restaurant|
  rand(1..10).times do
    review = Review.new(
      rating: rand(0..5),
      content: Faker::Restaurant.review,
      restaurant_id: restaurant[:id]
    )
    review.save!
  end
end
puts 'Finished!'
