@sprint10
Feature: login

  Background:
    Given user is able to login with valid admin credentials
    When user clicks on login button

  @smoke @sprint3
  #Scenario: valid admin login
  #  When user enters valid admin username and password
   # And user clicks on login button
   # Then admin user is successfully logged in

  @regression @sprint2
 # Scenario: valid ess login
  #  When user enters valid ess username and password
  #  And user clicks on login button
  #  Then ess user is successfully logged in

  @smoke @regression @sprint1
 # Scenario: valid username and invalid password
  #  When user enters valid username and invalid password
  #  And user clicks on login button
  #  Then user see invalid credentials message on login page

  @review
  Scenario: Test scenario for dashboard verification functionality
    Then user verify dashboard page

  @review
  Scenario: Test scenario for add employee functionality
    When user clicks on PIM option and Add Employee option
    Then user is navigates to add employee page