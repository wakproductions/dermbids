Feature: Authentication
  As a user
  I want to authenticate
  So that I can access protected areas of the site

# The below scenarios have been commented out because they mainly test the Devise gem, which is
# pretty thoroughly tested to work already. But I coped this code from another project and I'm
# leaving it here just in case its needed later for helping test later authentication features.

  Background:
    Given an administrator account is created with the email "administrator-jones@example.com" and password "secretpassword"
    And I am not logged in

  Scenario: I should not be able to access the protected areas of the site when not authenticated
    When I visit the administrator home page
    Then I should be redirected to the user sign in page
    And I should see "Sign in"
    And I should see "Email"
    And I should see "Password"
    And I should not see "Dermbids Administration"

  Scenario: I should be able to log in
    When I log in as "administrator-jones@example.com" with password "secretpassword"
    Then I should be redirected to the administrator quote request summary page
    And I should see "Dermbids Administration"


#  Scenario: Successfully log out of the application
#    Given I am logged in as "jones@example.com" with password "secretpassword"
#    When I logout
#    Then I should see "Signed out successfully"
#    And I should be on the homepage
#    And I should see "Log in"

#  Scenario: Unsuccessful login attempt
#    When I try to login as "bob@bob.com" with password "secretpassword"
#    Then I should see "Invalid email or password"
#    And I should see the "Sign in" button

#  @time-travel
#  Scenario: User session timeout
#    Given I am logged in as "jones@example.com" with password "secretpassword"
#    And 30 minutes of time has elapsed
#    And I visit the homepage
#    Then I should see "Your session expired."
#    And I should see "Log in"

#  @time-travel
#  Scenario: User session not timedout yet
#    Given I am logged in as "jones@example.com" with password "secretpassword"
#    And 10 minutes of time has elapsed
#    And I visit the homepage
#    Then I should not see "Your session expired."
#    And I should see "Log out"

#  Scenario: remembering users so they don't have to log in again for a while
#    And I am logged in as "jones@example.com" with password "secretpassword" and the Remember Me option checked
#    When I close my browser (clearing the session)
#    And I visit the homepage
#    Then I should see "Log out"

#  Scenario: don't remember users across browser restarts if they don't want it
#    And I am logged in as "jones@example.com" with password "secretpassword" without the Remember Me option checked
#    When I close my browser (clearing the session)
#    And I visit the homepage
#    Then I should see "Log in"

#  Scenario: Password reset
#    When I visit the password reset page
#    And I submit my email address "jones@example.com"
#    Then I should see "You will receive an email with instructions about how to reset your password"
#    And an email should have been sent to "jones@example.com"

#  Scenario: User changes password
#    Given I am logged in as "jones@example.com" with password "secretpassword"
#    When I visit the change password page
#    And I enter "secretpassword" as the current password and "newpassword" as the new password
#    Then I should see "You updated your account successfully"

#  Scenario: User logs in with newly changed password
#    Given I am logged in as user "jones@example.com" and changed my password from "secretpassword" to "newpassword"
#    When I logout
#    And I try to login as "jones@example.com" with password "newpassword"
#    Then I should see "Signed in successfully"