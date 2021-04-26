# feature/register.feature
Feature: Register
  As a potential member
  So that can see information about movies that interest me
  I want register for the application
  
@omniauth_test1
Scenario: Register
  Given I am on the home page
  And I press "Sign up"
  Then I am on the Authorize page
  And I should see "Welcome Tester Suny! You have signed up via GitHub."

@omniauth_test2
Scenario:  Can't Register without SUNY ID
  Given I am on the home page
  And I press "Sign up"
  Then I should see "Only Students and Staff belonging to SUNY Binghamton can register for this app"

