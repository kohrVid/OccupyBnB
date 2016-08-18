Feature: Abodes View
  
  Scenario: A squatter can view approved abodes
    Given a squatter has created an account
    And they have logged in
    And some abodes have been submitted and approved
    When they visit the abodes index page
    Then they should be able to see approved abodes

  Scenario: A squatter cannot view unapproved abodes
    Given a squatter has created an account
    And they have logged in
    And some abodes have been submitted and approved
    And some abodes have been submitted but remain unapproved
    When they visit the abodes index page
    Then they should be unable to see unapproved abodes

