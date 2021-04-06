Feature: display home page

    As a user
    So that I can get information about the project
    I want to see the home page
    
Scenario: I can see the application title
    Given I am on the home page
    Then I should see "BU Event Board"
    
Scenario: I click on login link
    Given I am on the home page
    When I follow "Log in"
    Then I should be on the home page
    
Scenario: I click on sign up link
    Given I am on the home page
    When I follow "Sign up"
    Then I should be on the home page
