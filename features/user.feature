Feature: Create paste
  In order to create a paste
  A visitor
  Should provide at least a content for the paste

  Scenario: Creates a paste with title and content
    Given I am on the homepage
    And I fill in "paste_title" with "New Paste"
    And I fill in "paste_content" with "This is my test paste"
    When I press "Save paste"
    Then I should see "This is my test paste" in selector "td.code"
    And I should see "New Paste" in selector "h3#paste-title"

  Scenario: Creates a paste without title but with content
    Given I am on the homepage
    And I fill in "paste_content" with "This is my test paste"
    When I press "Save paste"
    Then I should see "This is my test paste" in selector "td.code"
    And I should see "unnamed" in selector "h3#paste-title"

  Scenario: Tries to create a paste without content
    Given I am on the homepage
    When I press "Save paste"
    Then I should see "Content can't be blank" in selector ".alert-danger b"
