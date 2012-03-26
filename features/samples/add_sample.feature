@samples_wip
Feature: add a new sample

  As a health-concerned person
  I want to add a new blood sample
  So that I can track my Thyroid gland performance over time
	
  Scenario: add a new sample containing a value for TSH, T3 and T4
    Given that I am logged-in
    And that I am on the 'Add sample' page
    When I fill the 'Taken on' field with "2012-03-8"
    And I fill the "TSH" field with "4.0"
    And I fill the "T3" field with "7.4"
    And I fill the "T4" field with "2.1"
    And I click on the "Create Sample" button
    Then I should see a message indicating that the sample was "added"
    And I should be on the sample details page
    And the sample should have "2012-03-08" in the "Taken on" field
    And the sample should have "4.0" in the "TSH" field
    And the sample should have "7.4" in the "T3" field
    And the sample should have "2.1" in the "T4" field

  Scenario: attempt to add a sample with missing required fields
    Given that I am logged-in
    And that I am on the 'Add sample' page
    When I fill the 'Taken on' field with "2012-03-8"
    And I fill the "TSH" field with ""
    And I fill the "T3" field with ""
    And I fill the "T4" field with ""
    And I click on the "Create Sample" button
    Then I should see an error message indicating that the sample is missing required fields

  Scenario: new sample page title
    Given that I am logged-in
    When I visit "/samples/new"
    Then the page title should be "Thyracker | New sample"
