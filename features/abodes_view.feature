Feature: Abodes View
  
  Scenario: A squatter can view approved abodes
    Given they have created their account
    And they have logged in
    And some abodes have been submitted and approved
    When they visit the abodes index page
    Then they should be able to see approved abodes

