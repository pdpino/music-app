# Configure youtube API key

if ENV['YOUTUBE_API_KEY'].nil?
  puts "WARNING: You don't have a youtube API key!"
end

Yt.configure do |config|
  config.api_key = ENV['YOUTUBE_API_KEY']
end
