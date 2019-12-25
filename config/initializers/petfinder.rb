Petfinder.configure do |config|
  config.api_key = ENV['PETFINDER_API_KEY']
  config.api_secret = ENV['PETFINDER_SECRET_KEY']
end
petfinder = Petfinder::Client.new