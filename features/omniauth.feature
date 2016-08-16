Feature: Omniauth
  @omniauth
  Scenario: A squatter can link their account to twitter
    Given they have created their account
    And they have logged in
    When a squatter visits the edit account page
    And they click "Link to my Twitter account"
    And they log out
    And they visit the log in page
    And they click "Sign in with Twitter"
    Then they can log in
