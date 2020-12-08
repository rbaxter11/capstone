# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# user = User.new(username: "First User", email: "firstuser@example.com", password: "password")
# user.save

game = Game.new(name: "Yahtzee", num_of_players: 4, duration: 30, difficulty: 8, boxart: "yahtzee.jpg", user_id: 1)
game.save

# meetup = Meetup.new(location_name: "Starbucks", datetime: "Tuesday January 1 2021", game_id: 1, host_id: 1, participant_id: 2)
# meetup.save
