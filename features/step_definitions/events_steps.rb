Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    Event.create! event
  end
end

Then /(.*) seed events should exist/ do | n_seeds |
  Event.count.should be n_seeds.to_i
end

Then /I should see the correct number of events cards/ do
    num_events = Event.all.size
    num_events_cards = all(:css, ".card").size
    expect(num_events_cards).to eq num_events
end

Then /I should see the correct number of events with a search: (.*)/ do | query |
    num_events = Event.search_description(query).size
    num_events_cards = all(:css, ".card").size
    expect(num_events_cards).to eq num_events
end