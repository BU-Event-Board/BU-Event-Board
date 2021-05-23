Feature: display upcoming events in visually appealing format
   
    As a logged in user
    So that I can quickly find upcoming events
    I want to see events
  
Background: events have been added to the database

    Given the following events exist:
    | description        |
    | Upcoming event #1  |
    | Upcoming event #2  | 
    | Upcoming event #3  |
    | Upcoming event #4  |
    | Upcoming event #5  |
    | Upcoming event #6  |
    | Upcoming event #7  |
    | Upcoming event #8  |
    | Upcoming event #9  |
    | Upcoming event #10 |
  
    And I am on the home page
    Then 10 seed events should exist

Scenario: I can see the events index
    Given I am on the home page
    Then I should see "Listing events"
    
Scenario: I can see the correct number of events cards
    Given I am on the home page
    Then I should see the correct number of events cards
