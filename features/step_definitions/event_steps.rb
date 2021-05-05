Given /the following authorizations exist/ do |authorizations_table|
  authorizations_table.hashes.each do |authorization|
    Authorization.create! authorization
    puts 'create authorization'
    p Authorization.all
  end
end

Given /the following users exist/ do |users_table|
  users_table.hashes.each do |user|
    User.create! user
    puts 'create user'
    p User.all
  end
end