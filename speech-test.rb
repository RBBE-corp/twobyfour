require "google/cloud/speech"


speech = Google::Cloud::Speech.speech do |config|
  config.credentials = "credentials.json"
end

# audio_file_path = "./app/assets/audio/flashcard_greetings/aka.wav"
audio_file_path = "./Recording.m4a"

audio_file = File.binread audio_file_path
config = {
  language_code: 'ja-JP',
  # encoding: :MP3,
  # sample_rate_hertz: 44100,
  audio_channel_count: 2,
  enable_separate_recognition_per_channel: true
}

audio      = { content: audio_file }

puts "Operation started"

response = speech.recognize config: config, audio: audio
results = response.results

puts response

alternatives = results.first.alternatives
alternatives.each do |alternative|
  puts "Transcription: #{alternative.transcript}"
end