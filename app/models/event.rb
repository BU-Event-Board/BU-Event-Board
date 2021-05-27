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
end
