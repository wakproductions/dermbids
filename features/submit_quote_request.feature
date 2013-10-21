Feature: Submit a new quote request
# I just have stubs for tests here bc of time constraints, I can't write the tests but
# I at least want to have the documentation here so you know what its supposed to do.
# TODO-Test complete tests for these items

  Scenario: User successfully submits a quote request
    Then I should see a thank you page


  Scenario: User does not check the "includes ruler, coin, etc." box
    When I don't check the box
    Then I should see a javascript alert telling me to check the box
