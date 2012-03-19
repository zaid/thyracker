Feature: update samples

  As a health-concerned person who is prone to errors
  I want to be able to update one or more of my samples
  So that I can quickly fix typos in my created samples

  Scenario: two existing samples and I want to update one from the listing page
    Given that I am logged-in
    And that I have a sample with values "4.3", "2.1" and "0.9"
    And that I have a sample with values "5.7", "4.4" and "2.5"
    And that I am on the sample listing page
    When I click the 'Update' button for the first sample
    And I fill the "TSH" field with "4.8" 
    And I click on the "Update" button
    Then the sample should have "4.8" in the "TSH" field
    And I should see a message indicating that the sample was "updated"

  Scenario: update sample page title
    Given that I am logged-in
    And that I have a sample with values "4.3", "2.1" and "0.9"
    And that I have a sample with values "5.7", "4.4" and "2.5"
    And that I am on the sample listing page
    When I click the 'Update' button for the first sample
    Then the page title should be "Thyracker | Update sample"
 
