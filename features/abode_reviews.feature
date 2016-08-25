Feature: Abode Review
  Background:
    Given a squatter has created an account
    And they have logged in
    And an abode has been submitted and approved

  @javascript
  Scenario: Squatters can add a review to an abode
    When they visit the abode's show page
    And they click on Add a review
    And they write a review
    And they click "Submit abode review"
    And they visit the abode's show page
    Then they should see their review on the page

