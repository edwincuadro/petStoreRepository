@updatePet
Feature: Update a pet
  As QA automation
  I want update an existing pet
  Yo validate the response and status code

  Background: Consume the service
    * url url
    * def requestBody = read('classpath:karate/features/pet/3.updatePet/updatePetBody.json')
    * def responseUpdatePet = read('classpath:karate/features/pet/3.updatePet/updatePetBody.json')

  @updatePetHP
  Scenario: Update a pet

    Given path 'pet'
    And request requestBody
    When method PUT
    Then status 200
    And match response == responseUpdatePet
    And assert response.id == id
    And assert response.status == statusUpdate

  @updatePetNegative
  Scenario Outline: Update a pet with a invalid category
    * def categoryName = <name>
    Given path 'pet'
    And request requestBody
    And  category:name, categoryName
    When method PUT
    Then status 200
    And match response == responseUpdatePet

    Examples:
      | name      |
      | "#nulll"  |
      | 123651231 |