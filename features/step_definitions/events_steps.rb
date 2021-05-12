Given /the following events exist/ do |events_table|
  events_table.hashes.each do |event|
    Event.create! event
  end
end

Then /(.*) seed events should exist/ do | n_seeds |
  Event.count.should be n_seeds.to_i
end