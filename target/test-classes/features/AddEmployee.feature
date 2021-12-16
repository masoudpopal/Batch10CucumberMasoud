Feature: Add Employee

  Background:
    And user is logged in with valid admin credentials
    When user clicks on PIM option
    And user clicks on Add Employee button

  @1027
  Scenario: first scenario of adding the employee
    And user enters firstname middlename and lastname
    And user clicks on save button
    Then employee added successfully

  @1027
  Scenario: second scenario of adding the employee
    And user enters firstname middlename and lastname
    When user deletes employee id
    And user clicks on save button
    Then employee added successfully

  @1027
  Scenario: third scenario of adding the employee
    And user enters firstname middlename and lastname
    And user selects checkbox
    When user enters username password and confirmpassword
    And user clicks on save button
    Then employee added successfully

  @1028
  Scenario: adding an employee from feature file
    And user enters "Mike12" "lopez" and "meme"
    And user clicks on save button
    Then employee added successfully

  @examples
  Scenario Outline: adding an employee from feature file
    And user enters "<firstName>" "<middleName>" and "<lastName>" for an employee
    And user clicks on save button
    Then employee added successfully
    Examples:
      |firstName|middleName|lastName|
      |mike123  |meme      |lopez   |
      |nailya321|meme      |reston  |
      |sule456  | meme     |  abc   |



  @datatable
  Scenario: adding an employee using data table
    When I add multiple employees and verify them that user has been added successfully
      |firstName|middleName|lastName|
      |mike123  |meme      |lopez   |
      |nailya321|meme      |reston  |
      |sule456  | meme     |  abc   |
      |nailya33221|meme      |rerrston  |
      |sule456233  | meme     |  arrrbc   |

  @smoke @sprint12 @regression
  Scenario: adding an employee using data table
    When I add multiple employees and verify them that user has been added successfully in application
      |firstName|middleName|lastName|
      |mike1566233  |meme      |lopez   |
      |nailya333213|meme      |reston  |
      |nailya4333213|meme      |reston  |


  @excel
  Scenario: Adding an employee from excel file
    When user adds multiple employees from excel file usin "EmployeeData" sheet and verify the added employee
  @db @regression
  Scenario: Adding employee and validating in DataBase
    When user enters "Mike" "Lopez" and "Meme"
    And captures employee id
    And user clicks on save button
    And employee added successfully
    Then query HRMS database
    And verify employee data is matched in ui and db






