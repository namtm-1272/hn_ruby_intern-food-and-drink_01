# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Category.create!(
  name: "food"
)

Category.create!(
  name: "drink"
)

20.times do |n|
  title = Faker::Food.unique.dish
  description = Faker::Food.description
  price = Faker::Commerce.price(range: 1..100.0)
  thumbnail = Faker::Avatar.image
  product = Product.create!(name: title,
               unit_price: price,
               thumbnail: thumbnail,
               description: description,
               category_id: 1,
               created_at: (rand*30).days.ago,
               updated_at: (rand*30).days.ago
  )
  product.image.attach(io: File.open("#{Rails.root}/app/assets/images/images/phot#{n+1}.jpg"),
                                    filename: "photo#{n+1}.jpg",
                                    content_type: "image/jpg")
end

20.times do |n|
  title = Faker::Food.unique.fruits
  description = Faker::Lorem.sentence(word_count: 50)
  price = Faker::Commerce.price(range: 1..100.0)
  thumbnail = Faker::Avatar.image
  product = Product.create!(name: title,
               unit_price: price,
               thumbnail: thumbnail,
               description: description,
               category_id: 2,
               created_at: (rand*30).days.ago,
               updated_at: (rand*30).days.ago
  )
  product.image.attach(io: File.open("#{Rails.root}/app/assets/images/images/phot#{n+1}.jpg"),
                                    filename: "photo#{n+1}.jpg",
                                    content_type: "image/jpg")
end

Size.create!(
  size: 1
)

Size.create!(
  size: 2
)

Size.create!(
  size: 3
)

20.times do
  coefficient = Faker::Commerce.price(range: 1..100.0)
  ProductSize.create!(coefficient: coefficient,
                      product_id: Product.all.pluck(:id).sample,
                      size_id: Size.all.pluck(:id).sample
  )
end
