class Event < ActiveRecord::Base
    def self.create info
        create!(description: info['description'])
    end
end
