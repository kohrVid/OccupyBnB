Feature: Messaging

  Background:
    Given a squatter has created an account
    And a second squatter has created an account
    And they have logged in
  
  Scenario: A squatter can view inbox
    When they click inbox
    Then they are redirected to their inbox

  Scenario: A squatter can send a message to another squatter by clicking a button on their profile page
    When they visit the squatter's profile
    When they click "Send a PM"
    And they write a message
    And they click "Send"
    Then the message appears in their sent items list
    And the message appears in the recipient's inbox
  
  Scenario: A squatterr can reply to a message
    When they receive a message
    And they click the reply button
    And they write a reply
    And they click "Send"
    Then the message appears in their sent items list with Re: in the title
    And the message should appear in the original sender's inbox
