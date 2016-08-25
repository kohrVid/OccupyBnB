Feature: Squatter Review
  Background:
    Given a squatter has created an account
    And a second squatter has created an account
    And they have logged in

  @javascript
  Scenario: Squatters can add a review to an abode
    When they visit the squatter's profile
    And they click on Add a review
    And they write a review
    And they click "Submit squatter review"
    And they visit the squatter's profile
    Then they should see their review on the page

