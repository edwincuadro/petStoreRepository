@addPet
Feature: Add a new pet
  As QA automation
  I want to add a new pet
  To valid the status code and response

  Background: Consume the service
    * url url
    * def requestBody = read('classpath:karate/features/pet/1.addPet/addPetBody.json')
    * def responseAddPet = read('karate/features/pet/1.addPet/addPetResponse.json')

  @addPetHappyPath
  Scenario: Add a new pet with valid data

    Given path 'pet'
    And request requestBody
    When method post
    Then status 200
    * match response == responseAddPet
    And assert response.id == id
    And assert response.status == status

  @addPetNegative
  Scenario Outline: Add a new pet with invalid status
    Given path 'pet'
    And request requestBody
    And id, '<id>'
    And name, '<name>'
    And status, '<status>'
    When method POST
    Then status 200
    * match response == responseAddPet

    Examples:
      | status   | id      | name    |
      | 123451   | 12300   | 000     |
      | &%#*$    | &%#*$   | &%#*$   |
      | Arriving | test    | N/A     |
      | "#null"  | "#null" | "#null" |

