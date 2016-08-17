Feature: Squatter Registration
  
  Scenario: A squatter registers with the site
    Given they are on the registration page
    When they provide a valid email address
    And they provide a unique username
    And they provide their password
    And they click sign up
    Then they will be registered
