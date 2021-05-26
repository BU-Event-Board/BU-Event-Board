Feature: display the detailed event page
    As a user
    So that I can see a more detailed view of the event
    I can access the show page

Background: one event has been added to the database
    Given the following events exists:
    | description      |
    | My Event         |
    
    And I am on the home page
    Then 1 seed events should exist
    
Scenario: I click on the show link
    Given I am on the landing page
    When I follow "View event"
    Then I should be on the show page