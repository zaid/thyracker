Feature: navigation bar

  As a designer
  I want to have a global navigation bar
  So that I can give the site visitors a quick way to navigate the different areas of the site

  Scenario: 'Home' link
    When I visit "/"
    Then I should see a link labeled "Home"

  Scenario: 'Samples' link
    Given that I am logged-in
    When I visit "/"
    Then I should see a link labeled "Samples"

  Scenario: 'Charts' link
    Given that I am logged-in
    When I visit "/"
    Then I should see a link labeled "Charts"

  Scenario: 'Thyracker' logo link
    When I visit "/"
    Then I should see a link labeled "Thyracker"
