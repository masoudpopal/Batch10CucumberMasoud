Feature: Search employee

  @regression @sprint4
  Scenario: Search employee by id
    And user is logged in with valid admin credentials
    And user navigates to employee list page
    When user enters valid employee id
    And click on search button
    Then user see employee information is displayed

  @regression @sprint4
  Scenario: Search employee by name
    And user is logged in with valid admin credentials
    And user navigates to employee list page
    When user enters valid employee name
    And click on search button
    Then user see employee information is displayed
    #To comment something we use hash (#) in cucumber
    # everything you copy from the first scenario should be completely the same, if you add space or change any letter it will give error




