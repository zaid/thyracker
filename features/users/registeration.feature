Feature: register a new user account

  As a health-concerned person
  I want to register a new account
  So that I can track my Thyroid gland performance over time

  Scenario: register a new account that doesn't already exist
    Given that I am not logged-in
    When I visit "/"
    And I fill the "First name" field with "Joe"
    And I fill the "Last name" field with "Tester"
    And I fill the "Email" field with "joe@tester.ca"
    And I fill the "Password" field with "secret"
    And I fill the "Password confirmation" field with "secret"
    Then I click on the "Sign up" button
    And I should see a message indicating that the sign-up was successful
    And I should be logged-in

  Scenario: attempt to register a new account that already exists
    Given that I am not logged-in
    And that I have an existing user account with an email of "joe@tester.ca"
    When I visit "/"
    And I fill the "First name" field with "Joe"
    And I fill the "Last name" field with "Tester"
    And I fill the "Email" field with "joe@tester.ca"
    And I fill the "Password" field with "secret"
    And I fill the "Password confirmation" field with "secret"
    Then I click on the "Sign up" button
    And I should see an error message indicating that the user already exists

  Scenario: attempt to register a new account with empty fields
    Given that I am not logged-in
    When I visit "/"
    And I fill the "First name" field with ""
    And I fill the "Last name" field with ""
    And I fill the "Email" field with ""
    And I fill the "Password" field with ""
    And I fill the "Password confirmation" field with ""
    Then I click on the "Sign up" button
    And I should see an error message indicating that there are missing required fields
