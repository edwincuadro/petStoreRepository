@createUser
Feature: Create a new user
  As QA automation
  I want to create a new user
  To validate the response and status code

  Background: Consume the service
    * url url
    * def createUserBody = read('classpath:karate/features/user/1.createUser/createUserBody.json')

  Scenario: Create a new user with valid data
    * def createUserResponse = read('karate/features/user/1.createUser/createUserResponse.json')
    Given path 'user'
    And request createUserBody
    When method POST
    Then status 200
    And match response == createUserResponse
    And assert response.message == idUser

  Scenario Outline: Create a new user with valid status
    Given path 'user'
    And request createUserBody
    And createUserBody.userStatus = <status>
    When method POST
    Then status 500

    Examples:
      | status      |
      | "Available" |
      | "test"      |