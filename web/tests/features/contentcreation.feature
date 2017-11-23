Feature: Creating Basic Content
  As a Site Admin
  I am able to log in
  And publish content on the site

  @api @content @basicpage
  Scenario: As an Administrator I should be able to create Basic Page content
    Given I am logged in as a user with the "administrator" role
    When I visit "node/add/page"
    And I fill in "Title" with "My test content"
    And I fill in "Body" with "This is test content."
    And I press "Save"
    Then I should see "test content."

  @api @content @article
  Scenario: As an Administrator I should be able to create Article content
    Given I am logged in as a user with the "administrator" role
    When I visit "node/add/article"
    And I fill in "Title" with "My test content"
    And I fill in "Body" with "This is test content."
    And I fill in "Tags" with "article"
    And I press "Save"
    Then I should see "My test content"
    And I should see "This is test content."
    And I should see the link "article"

  @api @content @basicpage
  Scenario: As an Administrator I should be able to add a Menu Item
    Given I am logged in as a user with the "administrator" role
    When I visit "node/add/page"
    And I fill in "Title" with "foo"
    And I fill in "Body" with "This is test content."
    And I check the box "Provide a menu link"
    And I fill in "Menu link title" with "About Us"
    And I select "<Main navigation>" from "Parent item"
    And I press "Save"
    And I visit "/"
    And I should see "About Us"
    And I follow "About Us"
    Then I should see "test content."
