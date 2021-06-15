# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.all.destroy_all
User.create!(email: "admin@email.com", nickname: "Admin", address: "165 avenue de Bretagne", password: "123456")
User.create!(email: "christian@email.com", nickname: "Christian", address: "165 avenue de Bretagne", password: "123456")
User.create!(email: "thom@email.com", nickname: "Thom", address: "SDF", password: "123456")
User.create!(email: "thomas@email.com", nickname: "Thomas", address: "1 Rue de Normandie", password: "123456")

VideoGame.all.destroy_all
VideoGame.create!(title: "League Of Legends", plateform: "PC", price: 2, user: User.first, available: true, category: "MOBA")
VideoGame.create!(title: "WOW", plateform: "PC", price: 2, user: User.first, available: true, category: "MOBA")
VideoGame.create!(title: "Rocket League", plateform: "PC", price: 2, user: User.last, available: true, category: "MOBA")

Rent.all.destroy_all
Rent.create!(state: "Pending", user: User.last, video_game: VideoGame.first)
Rent.create!(state: "Pending", user: User.first, video_game: VideoGame.last)