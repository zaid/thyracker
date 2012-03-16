Feature: delete samples

  As a health-concerned person who is prone to errors
  I want to be able to delete one or more of my samples
  So that I can keep only the samples that I want

  @delete_sample
  Scenario: two existing samples and I want to delete one from the listing page
    Given that I am logged-in
    And that I have a sample with values "4.3", "2.1" and "0.9"
    And that I have a sample with values "5.7", "4.4" and "2.5"
    And that I am on the sample listing page
    When I click the 'Delete' button for the first sample
    Then the first sample should be deleted
    But the second sample should not be deleted

  Scenario: an existing sample to be deleted from the sample details page
    Given that I am logged-in
    And that I have a sample with values "4.4", "2.4" and "0.4"
    And that I am on the sample details page
    When I click the 'Delete' button
    Then the sample should be deleted

 
