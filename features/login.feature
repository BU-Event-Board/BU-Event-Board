Feature: Login
  As a registered member
  So that can see information about movies that interest me
  I want to login to the RottenPotatoes application

@omniauth_test3
Scenario: login
  Given I am on the landing page
  And I press "Sign up"
  Then I will see "Welcome Tester SUNY! You have signed up via github."
  And I am on the home page
  And I will see "All Movies" # This may be different for you
