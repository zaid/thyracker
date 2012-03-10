Feature: list samples

  As a health-concerned person
  I want to list my already added samples
  So that I can track my Thyroid gland performance over time

  Scenario: no samples exist
    Given that I am logged-in
    And that I am on the home page
    When I click on the "Samples" link
    Then I should not see any samples

  Scenario: two samples exist
    Given that I am logged-in
    And that I am on the home page
    And that I have a sample with values "4.3", "2.1" and "0.9"
    And that I have a sample with values "5.7", "4.4" and "2.5"
    When I click on the "Samples" link
    Then I should see my samples

