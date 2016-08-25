Feature: Search Squatters

  Background:
    Given some squatters have been created
    And a squatter has created an account
    And they have logged in

  Scenario: A squatter can search for users called Roslind
    When they visit the search page
    And they click "Find another squatter"
    And they type in Roslind
    And they click "Search"
    Then there should be one squatter in the results named Roslind
 
  Scenario: A squatter can search for users whose names start with "Ros"
    When they visit the search page
    And they click "Find another squatter"
    And they type in Ros
    And they click "Search"
    Then there should be one squatter in the results named Roslind

  Scenario: The squatter username search should be case-insensitive
    When they visit the search page
    And they click "Find another squatter"
    And they type in roS
    And they click "Search"
    Then there should be one squatter in the results named Roslind

