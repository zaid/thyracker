@pages_wip
Feature: home page

  As a designer
  I want to have a home page
  So that I can give the site visitors an overview of the application 

  Scenario: anonymous visitor
    Given that I am not logged-in
    When I visit "/"
    Then I should see a page with a title of "Thyracker | Home"

  Scenario: anonymous visitor greeted with a signup form
    Given that I am not logged-in
    When I visit "/"
    Then I should see a sign-up form
