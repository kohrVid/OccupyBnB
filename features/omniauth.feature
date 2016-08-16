Feature: Omniauth
  Background:
    Given they have created their account
    And they have logged in
  
  @omniauth
  Scenario: A squatter can link their account to twitter
    When a squatter visits the edit account page
    And they click "Link to my Twitter account"
    And they log out
    And they visit the log in page
    And they click "Sign in with Twitter"
    Then they can log in via twitter
  
  @omniauth
  Scenario: A squatter can link their account to facebook
    When a squatter visits the edit account page
    And they click "Link to my Facebook account"
    And they log out
    And they visit the log in page
    And they click "Sign in with Facebook"
    Then they can log in via facebook
