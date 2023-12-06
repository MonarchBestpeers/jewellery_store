# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Create a few sample products

products = [
  {
    name: "Product 1",
    description: "Description for Product 1",
    price: 19.99,
    quantity_available: 50,
    material: "Material 1",
    image: "https://example.com/image1.jpg"
  },
  {
    name: "Product 2",
    description: "Description for Product 2",
    price: 29.99,
    quantity_available: 30,
    material: "Material 2",
    image: "https://example.com/image2.jpg"
  },
  {
    name: "Product 3",
    description: "Description for Product 3",
    price: 39.99,
    quantity_available: 20,
    material: "Material 3",
    image: "https://example.com/image3.jpg"
  }
]

# Delete existing products
Product.delete_all

# Create new products
products.each do |product_data|
  10.times.each do
    Product.create!(product_data)
  end
end

puts "Seed data has been added."