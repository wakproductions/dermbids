Feature: As an admin I am able to organize the visible quotes by its status within the processing.
  As an admin
  I want to have separate "tabs" organize the quote requests by status - new, active, and archived
  So that I can see only quote requests relevant to what I'm doing

  Background:
    Given an administrator account is created with the email "administrator-jones@example.com" and password "secretpassword"
    And a set of quote requests with the values of:
      |email                          |full_name          |status  |
      |mcyrus-new@example.com         |Miley Cyrus        |new     |
      |jtimberlake-active@example.com |Justin Timberlake  |active  |
      |tjones-archived@example.com    |Tom Jones          |archived|
    And I am not logged in
    And I log in as "administrator-jones@example.com" with password "secretpassword"
    And I visit the administrator home page

  Scenario: I filter for only the newly submitted items
    When I click "New"
    Then I should see "mcyrus-new@example.com"
    And I should see "Miley Cyrus"
    And I should not see "Justin Timberlake"
    And I should not see "Tom Jones"

  Scenario: I filter for only the newly submitted items
    When I click "Active"
    Then I should see "jtimberlake-active@example.com"
    And I should see "Justin Timberlake"
    And I should not see "Miley Cyrus"
    And I should not see "Tom Jones"

  Scenario: I filter for only the newly submitted items
    When I click "Archived"
    Then I should see "tjones-archived@example.com"
    And I should see "Tom Jones"
    And I should not see "Miley Cyrus"
    And I should not see "Justin Timberlake"