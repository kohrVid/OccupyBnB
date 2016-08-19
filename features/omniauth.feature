Feature: Omniauth
  Background:
    Given a squatter has created an account
    And they have logged in
  
  @omniauth
  Scenario: A squatter can link their account to twitter
    When a squatter visits the edit account page
    And they click "Link to Twitter"
    And they log out
    And they visit the log in page
    And they click "Sign in with Twitter"
    Then they can log in via twitter
  
  @omniauth
  Scenario: A squatter can link their account to facebook
    When a squatter visits the edit account page
    And they click "Link to Facebook"
    And they log out
    And they visit the log in page
    And they click "Sign in with Facebook"
    Then they can log in via facebook
  
  @omniauth
  Scenario: A squatter can link their account to instagram
    When a squatter visits the edit account page
    And they click "Link to Instagram"
    And they log out
    And they visit the log in page
    And they click "Sign in with Instagram"
    Then they can log in via instagram
