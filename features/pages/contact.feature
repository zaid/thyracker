Feature: contact page

  As a designer
  I want to have a contact page
  So that I can give the site visitors a way to contact me

  Scenario: anonymous visitor
    Given that I am not logged-in
    When I visit "/contact"
    Then I should see a page with a title of "Thyracker | Contact"
