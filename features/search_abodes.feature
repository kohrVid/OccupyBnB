Feature: Search Abodes

  Background:
    Given some abodes have been submitted and approved
    And a squatter has created an account
    And they have logged in

  @javascript
  Scenario: A squatter can search for abodes within 5km
    When they visit the search page
    And they click "Find an abode"
    And they search select a distance of 5km
    And they click "Search"
    Then there should be one abode in the search results

  @javascript
  Scenario: A squatter can search for abodes within 10km
    When they visit the search page
    And they click "Find an abode"
    And they search select a distance of 10km
    And they click "Search"
    Then there should be two abodes in the search results

  @javascript
  Scenario: A squatter can search for abodes within 25km
    When they visit the search page
    And they click "Find an abode"
    And they search select a distance of 25km
    And they click "Search"
    Then there should be three abodes in the search results
