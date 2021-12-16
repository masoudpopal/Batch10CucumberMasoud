Feature: Error validation in login page

  @error
  Scenario: valid username and invalid password
    When user enters invalid credentials and clicks on login and verify the error
      |username|password|errorMessage|
      |Admin   | Hum@n  |Invalid credentials|
      |Admin1  |Hum@nhrm123|Invalid credentials|

  @errorvalidation
  Scenario Outline: valid username and invalid password
    When user enters invalid "<username>" and "<password>" and clicks on login and verify the "<errorMessage>"
    Examples:
      |username|password|errorMessage|
      |Admin   | Hum@n  |Invalid credentials|
      |Admin1  |Hum@nhrm123|Invalid credentials|
      |Admin   |        |Password cannot be empty|
      |        | Hum@nhrm123  |Username cannot be empty|
