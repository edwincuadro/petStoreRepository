@loginUser
Feature: Log in an user
  As QA automation
  I want to Log in an user
  To validate the response and status code

  Background: Consume the service
    * url url
    * def responseBody = read('classpath:karate/features/user/1.createUser/createUserResponse.json')
  Scenario: Log in with valid data
    Given path 'user', 'login'
    And request responseBody.username, responseBody.password
    When method GET
    Then status 200

  Scenario Outline: Log in with invalid data
    Given path 'user', 'login'
    And request responseBody.username = <username>, responseBody.password = <password>
    When method GET
    Then status 200

    Examples:
      | username | password |
      | 123      | "#null"  |
      | "#$%&"   | "."      |