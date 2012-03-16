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

  Scenario: a 'Details' and 'Delete' link on each sample
    Given that I am logged-in
    And that I am on the home page
    And that I have a sample with values "5.5", "4.2" and "0.11"
    And that I have a sample with values "2.5", "7.2" and "1"
    When I click on the "Samples" link
    Then I should see a "Details" button for each sample
    And I should see a "Delete" button for each sample

