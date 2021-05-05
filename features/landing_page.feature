Feature: display landing page

    As a user
    So that I can get information about the project
    I want to see the landing page
    
Scenario: I can see the application title
    Given I am on the landing page
    Then I should see "BU Event Board"
    
Scenario: I click on about link
    Given I am on the landing page
    When I follow "About"
    Then I should be on the about page
