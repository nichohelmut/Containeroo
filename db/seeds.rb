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
User.create(first_name: "Nicholas", last_name: "Utikal", email:"nicholasutikal@gmail.com", password: 123456)
User.create(first_name: "Markus", last_name: "Haag", email:"markus@gmail.com", password: 123456)
User.create(first_name: "Peter", last_name: "Tänzer", email:"peter@gmail.com", password: 123456)

Container.create(user_id: User.all.sample.id, product_category: "vegetables", address: "Friedrichstraße 100, 10117 Berlin", supermarket: "Plus", description: "very clean", photo: "https://piximus.net/media2/41297/restaurant-leaves-fridge-in-the-street-with-a-special-surprise-1.jpg")
Container.create(user_id: User.all.sample.id, product_category: "meats", address: "Chausseestraße 43, 10115 Berlin", supermarket: "Edeka", description: "not so clean and well guarded", photo: "https://i.pinimg.com/564x/0f/8f/75/0f8f7562930323df3897e7ab000ac411.jpg")
Container.create(user_id: User.all.sample.id, product_category: "bread", address: "Heinrich-Heine-Platz 8-12, 10179 Berlin", supermarket: "Private", description: "A loooot of products", photo: "https://piximus.net/media2/41297/restaurant-leaves-fridge-in-the-street-with-a-special-surprise-1.jpg")
Container.create(user_id: User.all.sample.id, product_category: "beer", address: "Greifswalderstraße 160, 10409 Berlin", supermarket: "Restaurant", description: "Not friendly", photo: "https://piximus.net/media2/41297/restaurant-leaves-fridge-in-the-street-with-a-special-surprise-1.jpg")
Container.create(user_id: User.all.sample.id, product_category: "bread", address: "Friedrichstraße 43-45, 10117 Berlin", supermarket: "Private", description: "A loooot of products", photo: "https://piximus.net/media2/41297/restaurant-leaves-fridge-in-the-street-with-a-special-surprise-1.jpg")
Container.create(user_id: User.all.sample.id, product_category: "cans", address: "Olympiastadium, Berlin", supermarket: "Aldi", description: "A loooot of products", photo: "https://piximus.net/media2/41297/restaurant-leaves-fridge-in-the-street-with-a-special-surprise-1.jpg")

