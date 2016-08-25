Feature: Abodes View
  Background:
    Given a squatter has created an account
    And they have logged in
  
  Scenario: A squatter can view approved abodes
    Given an abode has been submitted and approved
    When they visit the abodes index page
    Then they are able to see approved abodes

  Scenario: A squatter cannot view unapproved abodes
    Given an abode has been submitted and approved
    And some abodes have been submitted but remain unapproved
    When they visit the abodes index page
    Then they are unable to see unapproved abodes
  
  Scenario: A squatter can submit a new abode
    When they visit the new abode page
    And they enter abode details
    And they click "Submit abode"
    Then they are be able to see the abode in their list of submitted abodes

  Scenario: A squatter can submit a new abode with an uploaded image
    When they visit the new abode page
    And they enter abode details with a picture
    And they click "Submit abode"
    Then they are be able to see the abode's image in their list of submitted abodes

  # Commenting out as unable to test this feature in Capybara at present
  #  @wip @javascript
  #  Scenario: A squatter can submit a new abode with multiple images
  #    When they visit the new abode page
  #    And they enter abode details with a picture
  #    And they click "Add image"
  #    And they attach another picture
  #    And they click "Submit abode"
  #    Then they are able to see a link to the second image

  Scenario: A squatter can view an approved abode's show page
    Given an abode has been submitted and approved
    When they visit the abode's show page
    Then they can see the abode details
 
