@findPet
Feature: Find a pet by id
  As QA automation
  I want to find a pet by ID
  To validate the response and status code

  Background: API service
    * url url
    * def responseAddPet = read('classpath:karate/features/pet/1.addPet/addPetBody.json')

  @findPetHP
  Scenario: Find a pet with correct ID
    Given path 'pet', id
    When method GET
    Then status 200
    And match response == responseAddPet
    And assert response.id == id
    And assert response.status == status

  @findPetNegative
  Scenario Outline: Find a pet with incorrect ID
    Given path 'pet', <id>
    When method GET
    Then status 404
    And match response == <expect>

    Examples:
      | id                       | expect                                                                                                                        |
      | "test"                   | {"code": 404,"type": "unknown", "message": "java.lang.NumberFormatException: For input string: \"test\""}                     |
      | 00631                    | {"code": 1, "type": "error", "message": "Pet not found"}                                                                      |
      | "110#"                   | {"code": 404, "type": "unknown", "message": 'java.lang.NumberFormatException: For input string: "110#"'}                                                                      |
      | "#null"                  | {"code":404,"type":"unknown","message":"java.lang.NumberFormatException: For input string: \"#null\""}                        |
      | "&%#*$!"                 | {"code":404,"type":"unknown","message":"java.lang.NumberFormatException: For input string: \"&%#*$!\""}                       |
      | 012365478963012547856321 | {"code": 404,"type": "unknown", "message": 'java.lang.NumberFormatException: For input string: "1.2365478963012547E22"'} |

