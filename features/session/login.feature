Feature: sign-in

  As a Thyracker user with an existing account
  I want to login to Thyracker
  So that I can track my Thyroid gland's performance over time

  Background: on the home page with an existing user account
    Given that I am on the home page
    And that I have an existing user account with an email of "j@tester.ca"
    And that I am not logged-in

  Scenario: logging-in with invalid user credentials
    When I fill the "email" field with "baduser@place.ca"
    And I fill the "password" field with "magic"
    And I click on the "Sign in" button
    Then I should not be logged-in
    And I should see an error about invalid credentials

  Scenario: logging-in with valid user credentials
    When I fill the "email" field with "j@tester.ca"
    And I fill the "password" field with "secret"
    And I click on the "Sign in" button
    Then I should be logged-in
    And I should see a message indicating successful login
