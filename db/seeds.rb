# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.all.destroy_all
User.create!(email: "admin@email.com", nickname: "Admin", address: "165 avenue de Bretagne", password: "123456", admin: true)
User.create!(email: "christian@email.com", nickname: "Christian", address: "165 avenue de Bretagne", password: "123456")
User.create!(email: "thomas@email.com", nickname: "Thomas", address: "1 Rue de Normandie", password: "123456")
User.create!(email: "tom@email.com", nickname: "Tom", address: "SDF", password: "123456")

VideoGame.all.destroy_all
VideoGame.create!(title: "League Of Legends", plateform: "PC", price: 3, user: User.first, available: true, category: "MOBA", photo: "https://theme.zdassets.com/theme_assets/43400/87a1ef48e43b8cf114017e3ad51b801951b20fcf.jpg")
VideoGame.create!(title: "WOW", plateform: "PC", price: 4.5, user: User.first, available: true, category: "MMORPG", photo: "https://images-na.ssl-images-amazon.com/images/I/510Xjw4h8kS._AC_.jpg")
VideoGame.create!(title: "Rocket League", plateform: "PS4", price: 2, user: User.last, available: true, category: "SPORT", photo: "https://i.jeuxactus.com/datas/jeux/r/o/rocket-league/xl/rocket-league-jaquette-5b290e6f64add.jpg")
VideoGame.create!(title: "Dead or Alive 2", plateform: "Dreamcast", price: 8, user: User.find_by(nickname: "Tom"), available: true, category: "Versus Fighting", photo: "https://upload.wikimedia.org/wikipedia/en/d/d6/Dead_or_Alive_2_cover_art.png")

Rent.all.destroy_all
Rent.create!(state: "Pending", user: User.last, video_game: VideoGame.first)
Rent.create!(state: "Pending", user: User.first, video_game: VideoGame.last)
