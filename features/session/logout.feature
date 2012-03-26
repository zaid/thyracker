Feature: sign-out

  As a logged-in Thyracker user
  I want to logout from Thyracker
  So that I can protect my account from outsiders

  Background: on the home page (logged-in)
    Given that I am on the home page
    And that I am logged-in

  Scenario: sign-out link
    When I click on the "Sign out" link
    Then I should not be logged-in
