Feature:
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
      |mjackson-revisit@example.com   |Michael Jackson    |revisit |
    And I am not logged in
    And I log in as "administrator-jones@example.com" with password "secretpassword"
    And I visit the administrator home page

  Scenario:
    When I click the first image link
    #Then I should be on the administrator view quote request page
