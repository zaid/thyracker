Feature: charts

  As a health-concerned person
  I want to see my samples charted
  So that I can visually see the changes in my samples over time

  Scenario: TSH chart
    Given that I am logged-in
    And that I am on the home page
    When I visit "/charts"
    Then I should see a "TSH" chart

  Scenario: T3 chart
    Given that I am logged-in
    And that I am on the home page
    When I visit "/charts"
    Then I should see a "T3" chart

  Scenario: T4 chart
    Given that I am logged-in
    And that I am on the home page
    When I visit "/charts"
    Then I should see a "T4" chart
