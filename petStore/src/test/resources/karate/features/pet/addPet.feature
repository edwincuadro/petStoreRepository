@addPet
Feature: Add a new pet
  As QA automation
  I want to add a new pet
  To valid the status code and response

  Background: Consume the service
    * url url
    * def requestBody = read('classpath:karate/features/pet/AddPetBody.json')
    * def responseAddPet = read('classpath:karate/features/pet/AddPetBody.json')
  @addPetHappyPath
  Scenario: Create a new pet with valid data

    Given path 'pet'
    And request requestBody
    When method post
    Then status 200
    * match response == responseAddPet
    And assert response.id == id
    And assert response.status == status

  @addPetNegative
  Scenario Outline: Add a new pet with invalid status
    * def statusAdd = '<status>'
    Given path 'pet'
    And request requestBody
    And status, statusAdd
    When method POST
    Then status 200
    * match response == responseAddPet

    Examples:
      | status   |
      | 123451   |
      | &%#*$    |
      | Arriving |
      | "#null"  |

