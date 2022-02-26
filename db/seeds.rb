# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning up database"
puts "......"
puts "......"

# Destroy order needs to be in the following order
# Please do not change the order

  # MemoryListFlashcard.destroy_all
  #   puts MemoryListFlashcard.count
  # Flashcard.destroy_all
  #   puts Flashcard.count
  # MemoryList.destroy_all
  #   puts MemoryList.count
  # Playlist.destroy_all
  #   puts Playlist.count
  # Composition.destroy_all
  #   puts Composition.count
  # Instrumental.destroy_all
  #   puts Instrumental.count
  # User.destroy_all
  #   puts User.count
  # PlaylistComposition.destroy_all
  #   puts PlaylistComposition.count
  # Score.destroy_all
  #   puts Score.count

ActiveRecord::Base.connection.disable_referential_integrity do
  Flashcard.destroy_all
  MemoryList.destroy_all
  Playlist.destroy_all
  MemoryListFlashcard.destroy_all
  Composition.destroy_all
  Instrumental.destroy_all
  User.destroy_all
  PlaylistComposition.destroy_all
  Score.destroy_all
end

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
# variable naming convention - primary artist, track name
# naming convention - use underscores for spaces

a1_always = Instrumental.create!(
  title: "always",
  artist: "A1 ft Chris Brown & Ty Dolla Sign",
  genre: "RnB",
  duration: 53.760,
  bpm: 71.510
)
puts "instrumental added"

kap_g_top_5 = Instrumental.create!(
  title: "top_5",
  artist: "Kap G ft Playboi Carti",
  genre: "Trap",
  duration: 49.633,
  bpm: 77.32
)
puts "instrumental added"

major_lazer_lean_on = Instrumental.create!(
  title: "lean_on",
  artist: "Major Lazer",
  genre: "Moombahton",
  duration: 39.079,
  bpm: 98.2
)
puts "instrumental added"

saigon_relafriendship = Instrumental.create!(
  title: "relafriendship",
  artist: "Saigon",
  genre: "Hip Hop",
  duration: 42.736,
  bpm: 89.82
)
puts "instrumental added"

too_short_just_another_day = Instrumental.create!(
  title: "just_another_day",
  artist: "Too Short",
  genre: "G-Funk",
  duration: 39.262,
  bpm: 97.88
)
puts "instrumental added"

puts "all instrumentals created"
# /////////////////////////////////

# /////////// Flashcards //////////////
# naming convention - use underscore for spaces, same for variable name
# naming convention - english word then japanese word for variable name

hello_konnichiwa = Flashcard.create!(
  english_word: "hello",
  japanese_word: "konnichiwa",
  category: "greetings"
)

good_morning_ohayou_gozaimasu = Flashcard.create!(
  english_word: "good_morning",
  japanese_word: "ohayou_gozaimasu",
  category: "greetings"
)

nice_to_meet_you_hajimemashite = Flashcard.create!(
  english_word: "nice_to_meet_you",
  japanese_word: "hajimemashite",
  category: "greetings"
)

excuse_me_sumimasen = Flashcard.create!(
  english_word: "excuse_me",
  japanese_word: "sumimasen",
  category: "greetings"
)

im_sorry_gomen_nasai = Flashcard.create!(
  english_word: "im_sorry",
  japanese_word: "gomennasai",
  category: "greetings"
)

thank_you_arigatou_gozaimasu = Flashcard.create!(
  english_word: "thankyou",
  japanese_word: "arigatou_gozaimasu",
  category: "greetings"
)

please_onegaishimasu = Flashcard.create!(
  english_word: "please",
  japanese_word: "onegaishimasu",
  category: "greetings"
)

good_night_oyasumi_nasai = Flashcard.create!(
  english_word: "good_night",
  japanese_word: "oyasumi_nasai",
  category: "greetings"
)

red_aka = Flashcard.create!(
  english_word: "red",
  japanese_word: "aka",
  category: "colors"
)

orange_orenji = Flashcard.create!(
  english_word: "orange",
  japanese_word: "orenji",
  category: "colors"
)

yellow_kiiro = Flashcard.create!(
  english_word: "yellow",
  japanese_word: "kiiro",
  category: "colors"
)

green_midori = Flashcard.create!(
  english_word: "green",
  japanese_word: "midori",
  category: "colors"
)

blue_ao = Flashcard.create!(
  english_word: "blue",
  japanese_word: "ao",
  category: "colors"
)

purple_murasaki = Flashcard.create!(
  english_word: "purple",
  japanese_word: "murasaki",
  category: "colors"
)

black_kuro = Flashcard.create!(
  english_word: "black",
  japanese_word: "kuro",
  category: "colors"
)

white_shiro = Flashcard.create!(
  english_word: "white",
  japanese_word: "shiro",
  category: "colors"
)

monday_getsu_youbi = Flashcard.create!(
  english_word: "monday",
  japanese_word: "getsu_youbi",
  category: "days_of_the_week"
)

tuesday_ka_youbi = Flashcard.create!(
  english_word: "tuesday",
  japanese_word: "ka_youbi",
  category: "days_of_the_week"
)

wednesday_sui_youbi = Flashcard.create!(
  english_word: "wednesday",
  japanese_word: "sui_youbi",
  category: "days_of_the_week"
)

thursday_moku_youbi = Flashcard.create!(
  english_word: "thursday",
  japanese_word: "moku_youbi",
  category: "days_of_the_week"
)

friday_kin_youbi = Flashcard.create!(
  english_word: "friday",
  japanese_word: "kin_youbi",
  category: "days_of_the_week"
)

saturday_do_youbi = Flashcard.create!(
  english_word: "saturday",
  japanese_word: "do_youbi",
  category: "days_of_the_week"
)

sunday_nichi_youbi = Flashcard.create!(
  english_word: "sunday",
  japanese_word: "nichi_youbi",
  category: "days_of_the_week"
)

puts "Flash cards created"

# /////// MemoryList /////////
my_greetings_memory_list = MemoryList.create!(
  name: "My Favourite Greetings",
  user: byron
)

puts "Memorylist created"

my_colors_memory_list = MemoryList.create!(
  name: "My Favourite Colors",
  user: byron
)

puts "Memorylist created"

my_days_of_the_week_memory_list = MemoryList.create!(
  name: "My Favourite Days",
  user: byron
)

puts "Memorylist created"

# [konnichiwa, ohayo, hajimemashite, sumimasen, gomen, arigatou, onegai, oyasumi],


# //////////// MemoryListFlashcards ////////////

MemoryListFlashcard.create!(
  flashcard: good_morning_ohayou_gozaimasu,
  memory_list: my_greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: nice_to_meet_you_hajimemashite,
  memory_list: my_greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: excuse_me_sumimasen,
  memory_list: my_greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: im_sorry_gomen_nasai,
  memory_list: my_greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: thank_you_arigatou_gozaimasu,
  memory_list: my_greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: please_onegaishimasu,
  memory_list: my_greetings_memory_list
)

MemoryListFlashcard.create!(
  flashcard: good_night_oyasumi_nasai,
  memory_list: my_greetings_memory_list
)

puts "MemoryListFlashcards added"

MemoryListFlashcard.create!(
  flashcard: red_aka,
  memory_list: my_colors_memory_list
)

MemoryListFlashcard.create!(
  flashcard: orange_orenji,
  memory_list: my_colors_memory_list
)

MemoryListFlashcard.create!(
  flashcard: yellow_kiiro,
  memory_list: my_colors_memory_list
)

MemoryListFlashcard.create!(
  flashcard: green_midori,
  memory_list: my_colors_memory_list
)

MemoryListFlashcard.create!(
  flashcard: blue_ao,
  memory_list: my_colors_memory_list
)

MemoryListFlashcard.create!(
  flashcard: purple_murasaki,
  memory_list: my_colors_memory_list
)

MemoryListFlashcard.create!(
  flashcard: black_kuro,
  memory_list: my_colors_memory_list
)

MemoryListFlashcard.create!(
  flashcard: white_shiro,
  memory_list: my_colors_memory_list
)

puts "MemoryListFlashcards added"

MemoryListFlashcard.create!(
  flashcard: monday_getsu_youbi,
  memory_list: my_days_of_the_week_memory_list
)

MemoryListFlashcard.create!(
  flashcard: tuesday_ka_youbi,
  memory_list: my_days_of_the_week_memory_list
)

MemoryListFlashcard.create!(
  flashcard: wednesday_sui_youbi,
  memory_list: my_days_of_the_week_memory_list
)

MemoryListFlashcard.create!(
  flashcard: thursday_moku_youbi,
  memory_list: my_days_of_the_week_memory_list
)

MemoryListFlashcard.create!(
  flashcard: friday_kin_youbi,
  memory_list: my_days_of_the_week_memory_list
)

MemoryListFlashcard.create!(
  flashcard: saturday_do_youbi,
  memory_list: my_days_of_the_week_memory_list
)

MemoryListFlashcard.create!(
  flashcard: sunday_nichi_youbi,
  memory_list: my_days_of_the_week_memory_list
)

puts "MemoryListFlashcards added"

# ///////// Compositions Seeds ////////////

greetings_composition = Composition.create!(
  name: "Greetings Funk",
  memory_list: my_greetings_memory_list,
  instrumental: too_short_just_another_day,
  user: byron,
  rep_count: 19
)
puts "composition added"

Composition.create!(
  name: "Greetings RnB",
  memory_list: my_greetings_memory_list,
  instrumental: a1_always,
  user: byron,
  rep_count: 13
)
puts "composition added"

Composition.create!(
  name: "Greetings Moombah",
  memory_list: my_greetings_memory_list,
  instrumental: major_lazer_lean_on,
  user: byron,
  rep_count: 11
)
puts "composition added"

Composition.create!(
  name: "Greetings Hip Hop",
  memory_list: my_greetings_memory_list,
  instrumental: saigon_relafriendship,
  user: byron,
  rep_count: 15
)
puts "composition added"

Composition.create!(
  name: "Greetings Trap",
  memory_list: my_greetings_memory_list,
  instrumental: kap_g_top_5,
  user: byron,
  rep_count: 9
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
