# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create some sample concerts
#
10.times do
  Concert.create(
    title: Faker::Music::RockBand.name,
    description: Faker::Lorem.paragraph(sentence_count: 2),
    date: Faker::Date.between(from: 2.days.ago, to: 2.days.from_now),
    venue: Faker::Address.city,
    price: Faker::Number.decimal(l_digits: 2),
    bands: [Faker::Music::RockBand.name, Faker::Music::RockBand.name, Faker::Music::RockBand.name],
    city: Faker::Address.city
  )
end

# Add images to the concerts
Concert.all.each do |concert|
  image_src = Faker::LoremFlickr.image(size: "300x300", search_terms: ['concert'])
  image = URI.open(image_src)
  concert.image.attach(io: image, filename: "#{concert.title}.jpg", content_type: 'image/jpg')
end
