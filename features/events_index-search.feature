Feature: allow for searching of upcoming events
   
    As a logged in user
    So that I can quickly find upcoming events
    I want to be able to search events based on a query
  
Background: events have been added to the database

    Given the following events exist:
    | description        |
    | Past event #1  |
    | Past event #2  | 
    | Past event #3  |
    | Past event #4  |
    | Past event #5  |
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
    
Scenario: I can see the correct number of events with a search: Upcoming event
    Given I am on the home page
    And I fill in "query" with "Upcoming event"
    And I press "Search"
    Then I should see the correct number of events with a search: Upcoming event
