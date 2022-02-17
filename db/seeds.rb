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

# Destroy order needs to be in the following order
# Please do not change the order


  MemoryListFlashcard.destroy_all
    puts MemoryListFlashcard.count
  Flashcard.destroy_all
    puts Flashcard.count
  MemoryList.destroy_all
    puts MemoryList.count
  Playlist.destroy_all
    puts Playlist.count
  Composition.destroy_all
    puts Composition.count
  Instrumental.destroy_all
    puts Instrumental.count
  User.destroy_all
    puts User.count
  PlaylistComposition.destroy_all
    puts PlaylistComposition.count
  Score.destroy_all
    puts Score.count

# ActiveRecord::Base.connection.disable_referential_integrity do
#   Flashcard.destroy_all
#   MemoryList.destroy_all
#   Playlist.destroy_all
#   MemoryListFlashcard.destroy_all
#   Composition.destroy_all
#   Instrumental.destroy_all
#   User.destroy_all
#   PlaylistComposition.destroy_all
#   Score.destroy_all
# end

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
# )

# ///////////////////////////////////

# //////// Instrumental seeds ////////////

five_hundred_miles = Instrumental.create!(
  title: "500 Miles",
  artist: "Justin Timberlake",
  genre: "Country",
  duration: 194.4,
  bpm: 94
)
puts "instrumental added"


all_the_small_things = Instrumental.create!(
  title: "All the Small Things",
  artist: "Blink 182",
  genre: "Pop Punk",
  duration: 148.8,
  bpm: 149
)
puts "instrumental added"

lean_on = Instrumental.create!(
  title: "Lean On",
  artist: "Major Lazer",
  genre: "Electronic",
  duration: 153.6,
  bpm: 98
)
puts "instrumental added"

closer = Instrumental.create!(
  title: "Closer",
  artist: "Chainsmokers",
  genre: "Future Bass",
  duration: 242.4,
  bpm: 95
)
puts "instrumental added"

seven_nation_army = Instrumental.create!(
  title: "Seven Nation Army",
  artist: "White Stripes",
  genre: "Alternative Rock",
  duration: 211.2,
  bpm:124
)
puts "instrumental added"

simple_rap = Instrumental.create!(
  title: "The Simple Rap Song",
  artist: "Plague Doctor",
  genre: "Trap",
  duration: 153,
  bpm: 130
)
puts "instrumental added"

plastic_love = Instrumental.create!(
  title: "Plastic Love",
  artist: "Mariya Takeuchi",
  genre: "City Pop",
  duration: 270.6,
  bpm: 102
)
puts "instrumental added"

island_in_the_sun = Instrumental.create!(
  title: "Island in the Sun",
  artist: "Weezer",
  genre: "Alternative Rock",
  duration: 192,
  bpm: 115
)
puts "instrumental added"

everybody = Instrumental.create!(
  title: "Everybody",
  artist: "Backstreet Boys",
  genre: "Pop",
  duration: 207,
  bpm: 108
)

puts "all instrumentals created"
# /////////////////////////////////

# /////////// Flashcards //////////////

# Hello - konnichiwa
konnichiwa = Flashcard.create!(
  english_word: "hello",
  japanese_word: "konnichiwa",
  category: "greetings"
)

# Good morning - ohayou gozaimasu
ohayo = Flashcard.create!(
  english_word: "good_morning",
  japanese_word: "ohayou_gozaimasu",
  category: "greetings"
)
# Nice to meet you - hajimemashite
hajimemashite = Flashcard.create!(
  english_word: "nice_to_meet_you",
  japanese_word: "hajimemashite",
  category: "greetings"
)
# Excuse me - sumimasen
sumimasen = Flashcard.create!(
  english_word: "excuse_me",
  japanese_word: "sumimasen",
  category: "greetings"
)
# I'm sorry - gomen nasai
gomen = Flashcard.create!(
  english_word: "im_sorry",
  japanese_word: "gomen_nasai",
  category: "greetings"
)
# Thank you - arigatou gozaimasu
arigatou = Flashcard.create!(
  english_word: "thank_you",
  japanese_word: "arigaou_gozaimasu",
  category: "greetings"
)
# Please - onegaishimasu
onegai = Flashcard.create!(
  english_word: "please",
  japanese_word: "onegaishimasu",
  category: "greetings"
)
# Good night - oyasumi nasai
oyasumi = Flashcard.create!(
  english_word: "good_night",
  japanese_word: "oyasumi_nasai",
  category: "greetings"
)

puts "Flash cards created"

# /////// MemoryList /////////
greetings_memory_list = MemoryList.create!(
  name: "Greetings",
  user: byron
)

puts "Memorylist created"

# [konnichiwa, ohayo, hajimemashite, sumimasen, gomen, arigatou, onegai, oyasumi],


# //////////// MemoryListFlashcards ////////////

MemoryListFlashcard.create!(
  flashcard: ohayo,
  memory_list: greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: hajimemashite,
  memory_list: greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: sumimasen,
  memory_list: greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: gomen,
  memory_list: greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: arigatou,
  memory_list: greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: onegai,
  memory_list: greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: oyasumi,
  memory_list: greetings_memory_list
)

puts "MemoryListFlashcards added"

# ///////// Compositions Seeds ////////////

greetings_composition = Composition.create!(
  name: "Greetings",
  memory_list: greetings_memory_list,
  instrumental: everybody,
  user: byron,
  rep_count: 15
)

puts "composition added"


# days_of_the_week_composition = Composition.create!(
#   memory_list: "days of the week",
#   instrumental: closer,
#   user: byron,
#   rep_count: 10
# )
# puts "composition added"

# verbs_composition = Composition.create!(
#   memory_list: "verbs",
#   instrumental: all_the_small_things,
#   user: byron,
#   rep_count: 20
# )


# puts "composition added"
# //////////////////////////////////////

# /////////// Playlist Seeds //////////////////
puts "playlist"

greetings_playlist = Playlist.create!(
  name: "Greetings",
  user: byron
)
puts "playlist added"

# days_of_the_week_playlist = Playlist.create!(
#   name: "Days of the Week",
#   user: byron
# )
# puts "playlist added"

# verbs_playlist = Playlist.create!(
#   name: "Japanese Verbs",
#   user: byron
# )
# puts "playlist added"

# //////////////////////////////////

# ///////////// PlaylistEntry Seeds /////////////////////

PlaylistComposition.create!(
  composition: greetings_composition,
  playlist: greetings_playlist
)

# PlaylistComposition.create!(
#   composition: days_of_the_week_composition,
#   playlist: days_of_the_week_playlist
# )
# puts "playlist composition"

# PlaylistComposition.create!(
#   composition: verbs_composition,
#   playlist: verbs_playlist
# )

puts "playlist compositions created"

# ///////////// end /////////////////////


# ///////////// Score Seeds /////////////////////

Score.create!(
  score: 5,
  composition: greetings_composition
)
puts "score added"

# Score.create!(
#   score: 20,
#   composition: days_of_the_week_composition
# )
# puts "score added"

# Score.create!(
#   score: 20,
#   composition: verbs_composition
# )
# puts "score added"

puts "Database Seeded!"
# //////////////////////////////////
