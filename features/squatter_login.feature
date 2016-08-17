Feature: Squatter Login
  Background:
    Given they have created their account
  
  Scenario: A squatter can log in using their email address
    When they visit the log in page
    And they enter their email address
    And they type in their password
    And they click "Log in"
    Then they will be logged in successfully
  
