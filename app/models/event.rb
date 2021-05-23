class Event < ActiveRecord::Base
    def self.sort_events(sort_key)
        Event.order(sort_key)
    end

    def self.create info
        create!(description: info['description'])
    end
end
