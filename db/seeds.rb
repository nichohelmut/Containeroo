# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Container.destroy_all
User.destroy_all

User.create(first_name: "Hans", last_name: "müller", email:"hans@gmail.com", password: 123456)
User.create(first_name: "Max", last_name: "meier", email:"max@gmail.com", password: 123456)
User.create(first_name: "Jim", last_name: "Kennedy", email:"jim@gmail.com", password: 123456)

Container.create(user_id: User.all.sample.id, product_category: "vegetables", address: "Friedrichstraße 100, 10117 Berlin", supermarket: "Rewe", description: "very clean")
Container.create(user_id: User.all.sample.id, product_category: "meats", address: "Chausseestraße 43, 10115 Berlin", supermarket: "Edeka", description: "not so clean and well guarded")
Container.create(user_id: User.all.sample.id, product_category: "bread", address: "Heinrich-Heine-Platz 8-12, 10179 Berlin", supermarket: "Aldi", description: "A loooot of products")


