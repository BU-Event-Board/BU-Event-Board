Feature: display list of events sorted by different criteria
    As a user
    So that I can find the events in a useful manor
    I want to see the events sorted by description

Background: events have been added to the database

Given the following events exist:
    | description        | date         |
    | Upcoming event #3  | 2-May-2021   |
    | Upcoming event #1  | 4-Jun-2021   |
    | Upcoming event #7  | 28-Apr-2021  |
    | Upcoming event #6  | 8-May-2021   | 
    | Upcoming event #2  | 30-Apr-2021  |
    | Upcoming event #10 | 24-May-2021  |
    | Upcoming event #8  | 18-May-2021  |
    | Upcoming event #9  | 3-Nov-2021   |
    | Upcoming event #5  | 1-Jan-2022   |
    | Upcoming event #4  | 1-Jan-2021   |

    And I am on the home page
    Then 10 seed events should exist

Scenario: Sort events by description
    When I follow "Description"
    Then I should see "Upcoming event #2" before "Upcoming event #5"

Scenario: Sort events by date
    When I follow "Date"
    Then I should see "Upcoming event #7" before "Upcoming event #8"