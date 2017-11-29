Feature: Creating Basic Content
  As a Site Admin
  I am able to log in
  And publish/edit content on the site

Background:
  Given I am logged in as a user with the "administrator" role

  @api @content @basicpage
  Scenario: As an Administrator I should be able to create Basic Page content
    Given I am on "node/add/page"
    When I fill in "Title" with "My test content"
    And I fill in "Body" with "This is test content."
    And I press "Save"
    Then I should see "test content."

  @api @content @article
  Scenario: As an Administrator I should be able to create Article content
    Given I am on "node/add/article"
    When I fill in the following:
      | Title | My test content       |
      | Body  | This is test content. |
      | Tags  | article               |
    And I press "Save"
    Then I should see "My test content"
    And I should see "This is test content."
    And I should see the link "article"

  @api @content @basicpage @article
  Scenario Outline: As an Administrator I should be able to edit a node
    Given I am viewing a "<page_type>" with the title "<title>"
    Then I click "Edit" in the "content" region
    And I fill in the following:
      | Body | <body_text> |
    And I press "Save"
    Then I should see "<body_text>" in the "content" region
    Examples:
      | page_type | title        | body_text                 |
      | page      | Cool beans   | Beans are magical         |
      | article   | Cool article | This is going to be huge. |
