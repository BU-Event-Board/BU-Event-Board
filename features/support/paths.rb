# TL;DR: YOU SHOULD DELETE THIS FILE
#
# This file is used by web_steps.rb, which you should also delete
#
# You have been warned
module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name
        
    when /^the landing page$/
      landing_page_index_path      
    when /^the home page$/
      events_path
    
=begin
      Given I am on the home page
  And I press "Sign up"
  #Then I am on the Authorize page
  #And I should see message "Welcome Tester Suny! You have signed up via GitHub."
  Then I will see "Welcome Tester SUNY! You have signed up via github." 
  Then I am on the edit Profile user page for 'Tester SUNY'
  And I will see "Editing profile" 
=end
        
    when /^the edit Profile user page for "([^"]*)"$/
      user = find_by(name: $1)
      edit_user_profile_path(user, Profile.find_by(user_id: user.id))
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /^the (.*) page$/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue NoMethodError, ArgumentError
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
