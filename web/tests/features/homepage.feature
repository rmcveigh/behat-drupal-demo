Feature: Test Homepage
  In order to prove the homepage is behaving properly
  As a visitor
  I need to see the correct behavior

  @api @content @homepage
  Scenario: Viewing content in a region
    Given I am on the homepage
    Then I should see "No front page content has been created yet" in the "content"
