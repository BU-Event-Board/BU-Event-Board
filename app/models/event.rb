require 'json'
require 'httparty'
require 'twitter'

class Event < ActiveRecord::Base    
    def self.search_description(query, sort_key)
        if not @sort_key
            @sort_key = 'description'
        end
        Event.where("description LIKE ?", "%#{query}%").order(sort_key)
    end

    def self.create info
        create!(description: info['description'])
    end
    
    def self.create_from_twitter
        @eventslist = []
        #@event = Event.new(event_params)
         Event.all.each do |e|
             Event.delete(e)
         end

        client = Twitter::REST::Client.new do |config|
          config.consumer_key        = ENV["TWITTER_CLIENT_ID"] 
          config.consumer_secret     = ENV["TWITTER_CLIENT_SECRET"]
        end

        @Tweets = client.user_timeline('binghamtonu', count: 3200)
        #Tweets.each { |tweet| puts tweet.full_text }

        @Tweets.each do  |tweet|
          if tweet.full_text =~ /(a\.m\.|p\.m\.)/
            @eventslist.push(Event.new({:description => tweet.full_text,:date => tweet.created_at})) 
            p tweet.full_text
          end
        end 

        @eventslist.each do |x|
          x.save
        end

        return @eventslist
    end
end
