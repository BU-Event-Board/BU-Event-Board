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

Given /I am logged into/ do
  steps %Q{
    Given I am on the landing page
    And I press "Sign up"
    And I am on the home page
    }
end