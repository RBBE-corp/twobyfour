# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# //// Instrumental Ideas /////
# 500 miles
# country road
# maria takeuchi (plastic love) O
# back street boys everybody
# weezer island in the sun
# blink 182 all the small things
# foo fighter
# sum 41
# beatles I wanna hold your hands
# dancing queen abba
# yellow submarine
# never gonna give you up rick roll
# justin bieber sorry
# Mike Posner I took a pill in ibiza
# california love
# major lazer (light it up, lean on)
# white stripes 7 nation army
# chainsmoker -closer

puts "Cleaning up database"
puts "......"
puts "......"

Playlist.destroy_all
User.destroy_all
Score.destroy_all
Playlist.destroy_all
Composition.destroy_all

puts "Database is clean"
puts "Seeding database"
puts "......"


# ////// User Seeds ////////

byron = User.create!(
  password: "123456",
  email: "byron@gmail.com",
  username: "Byron Lee"
)

# reona = User.create!(
#   password: "123456",
#   email: "reona@gmail.com",
#   username: "Reona Kasuya"
# )

# babin = User.create!(
#   password: "123456",
#   email: "babin@gmail.com",
#   username: "Babin Bohora"
# )

# erika = User.create!(
#   password: "123456",
#   email: "erika@gmail.com",
#   username: "Erika Kawashima"
)


# //////// Instrumental seeds ////////////

500_miles = Instrumental.create!(
  title: "500 Miles",
  artist: "Justin Timberlake",
  genre: "Country",
  duration: 3.24,
  bpm: 94
)


all_the_small_things = Instrumental.create! (
  title: "All the Small Things",
  artist: "Blink 182",
  genre: "Pop Punk",
  duration: 2.48,
  bpm: 149
)

lean_on = Instrumental.create! (
  title: "Lean On",
  artist: "Major Lazer",
  genre: "Electronic",
  duration: 2.56,
  bpm: 98
)

closer = Instrumental.create(
  title: "Closer",
  artist: "Chainsmokers",
  genre: "Future Bass",
  duration: 4.04
  bpm: 95
)

seven_nation_army = Intsrumental.create!(
  title: "Seven Nation Army",
  artist: "White Stripes",
  genre: "Alternative Rock",
  duration: 3.52,
  bpm:124
)

simple_rap = Instrumental.create!(
  title: "The Simple Rap Song",
  artist: "Plague Doctor",
  genre: "Trap",
  duration: 2.55,
  bpm: 130
)

plastic_love = Instrumental.create!(
  title: "Plastic Love",
  artist: "Mariya Takeuchi",
  genre: "City Pop",
  duration: 4.51,
  bpm: 102
)

island_in_the_sun = Instrumental.create!(
  title: "Island in the Sun",
  artist: "Weezer",
  genre: "Alternative Rock",
  duration: 3.20,
  bpm: 115
)

everybody = Instrumental.create(
  title: "Everybody",
  artist: "Backstreet Boys",
  genre: "Pop",
  duration: 3.45,
  bpm: 108
)
# ////////// end /////////////////


# ///////// Compositions Seeds ////////////
# Composition.create!(
#   memory_list: [],
#   instrumental_id:,
#   user: babin,
#   rep_count:
# )


greetings_composition = Composition.create!(
  memory_list: ["Ohayou gozaimasu","Good morning","Konnichiwa","Hello","Konbanwa","Good evening","Oyasuminasai","Goodnight"],
  instrumental: simple_rap,
  user: byron,
  rep_count: 15
)

days_of_the_week = Composition.create!(
  memory_list: ["Ohayou gozaimasu","Good morning","Konnichiwa","Hello","Konbanwa","Good evening","Oyasuminasai","Goodnight"],
  instrumental: simple_rap,
  user: byron,
  rep_count: 10
)


# /////////// Playlist Seeds //////////////////

greetings_playlist = Playlist.create!(
  name: "Greetings",
  user: byron
)

days_of_the_week_playlist = Playlist.create!(
  name: "Days of the Week",
  user: byron
)

# //////////////////////////////////

PlaylistEntry.create!(
  composition: greetings_composition,
  playlist: greetings_playlist
)

Score.create!(
  score: 5,
  composition: greetings_composition
)
