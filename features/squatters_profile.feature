Feature: Squatters Profile page

  Scenario: Admin users can view all of a Squatter's details on profile page
    Given a squatter has created an account
    And an admin user has created an account
    And an admin is logged in
    When they visit the squatter's profile
    Then they can see the squatter's location
  
  Scenario: users can view all of their details on their profile page
    Given a squatter has created an account
    And they have logged in
    When they visit the squatter's profile
    Then they can see the squatter's location
  
  Scenario: Squatter's cannot view all details on another squatter's profile
    Given a squatter has created an account
    And a second squatter has created an account
    And the second squatter is logged in
    When they visit the squatter's profile
    Then they cannot see the squatter's location

