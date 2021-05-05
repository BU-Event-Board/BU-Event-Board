# feature/register.feature



Feature: Register
  As a potential member
  So that can see information about movies that interest me
  I want register for the application

Background: profiles in databasea

  Given the following profiles exists:
  | primary_language    |   secondary_language  |favorite_movie  |worst_movie|favorite_genre|user_id|
  |  English         | Music            | Blade Runner |Ishtar     |SciFi         |       |    
@omniauth_test1
Scenario: Register
  Given I am on the home page
  And I press "Sign up"
  Then I will see "Welcome Tester SUNY! You have signed up via github." 
  #Then I am on the RottenPotatoes edit Profile page for 'Tester SUNY'
  And I will see "Editing profile" 

@omniauth_test2
Scenario:  Can't Register without SUNY ID
  Given I am on the home page
  And I press "Sign up"
  Then I will see "ActiveRecord::RecordInvalid: Validation failed: Email must be for Binghamton University"
  And I am on the home page

