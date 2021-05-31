require 'json'
require 'httparty'
require 'twitter'


client = Twitter::REST::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_CLIENT_ID"] 
  config.consumer_secret     = ENV["TWITTER_CLIENT_SECRET"]
end

Tweets = client.user_timeline('binghamtonu', count: 3200)
#Tweets.each { |tweet| puts tweet.full_text }

Tweets.each do  |tweet|
    #if tweet.full_text =~ /([0-1]?[0-9]|2[0-3]):[0-5][0-9]/
     #   puts tweet.full_text 
    #if tweet.full_text =~ /(a\.m\.|p\.m\.)/
    #    Event.create(:description, tweet.full_text)
    #end
end

#/(a\.m\.|p\.m\.)/
