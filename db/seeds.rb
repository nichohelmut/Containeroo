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


url = "https://piximus.net/media2/41297/restaurant-leaves-fridge-in-the-street-with-a-special-surprise-1.jpg"
container = Container.create(user_id: User.all.sample.id, product_category: "vegetables", address: "Friedrichstraße 100, 10117 Berlin", supermarket: "Plus", description: "very clean")
container.remote_photo_url = url
container.save

url = "http://images.gizmag.com/hero/molson-passport-fridge.PNG"
container = Container.create(user_id: User.all.sample.id, product_category: "bread", address: "Heinrich-Heine-Platz 8-12, 10179 Berlin", supermarket: "Private", description: "A loooot of products")
container.remote_photo_url = url
container.save

url = "http://www.selfcity.be/uploads/3/8/5/1/38514543/1435914730.png"
container = Container.create(user_id: User.all.sample.id, product_category: "beer", address: "Greifswalderstraße 160, 10409 Berlin", supermarket: "Restaurant", description: "Not friendly")
container.remote_photo_url = url
container.save

url = "http://mylifeandkids.com/wp-content/uploads/2013/08/pushing-fridge-down-the-street.png"
container = Container.create(user_id: User.all.sample.id, product_category: "bread", address: "Friedrichstraße 43-45, 10117 Berlin", supermarket: "Private", description: "A loooot of products")
container.remote_photo_url = url
container.save

url = "https://techcrunch.com/wp-content/uploads/2014/08/screen-shot-2014-08-04-at-9-13-18-am.png?w=730&crop=1"
container = Container.create(user_id: User.all.sample.id, product_category: "cans", address: "Olympiastadium, Berlin", supermarket: "Aldi", description: "A loooot of products")
container.remote_photo_url = url
container.save


