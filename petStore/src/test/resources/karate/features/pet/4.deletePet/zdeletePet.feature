@deletePet
Feature: Delete pets
  As QA automation
  I want to delete a pet by ID
  To validate response and status code

  Background: API service
    * url url
  @deletePetHP
  Scenario: Delete a pet by correct ID
    * def deleteResponse = read('classpath:karate/features/pet/4.deletePet/deleteResponse.json')
    Given path 'pet', id
    When method DELETE
    Then status 200
    And match response == deleteResponse
    And assert response.message == message


  @deletePetNegative
  Scenario Outline: Delete a pet with incorrect ID
    Given path 'pet', <id>
    When method DELETE
    Then status 404
    And match response == <expect>

    Examples:
      | id                       | expect                                                                                                                   |
      | "test"                   | {"code": 404,"type": "unknown", "message": "java.lang.NumberFormatException: For input string: \"test\""}                |
      | 00631                    | ''                                                                                                                       |
      | "110#"                   | {"code": 404, "type": "unknown", "message": 'java.lang.NumberFormatException: For input string: "110#"'}                 |
      | "#null"                  | {"code":404,"type":"unknown","message":"java.lang.NumberFormatException: For input string: \"#null\""}                   |
      | "&%#*$!"                 | {"code":404,"type":"unknown","message":"java.lang.NumberFormatException: For input string: \"&%#*$!\""}                  |
      | 012365478963012547856321 | {"code": 404,"type": "unknown", "message": 'java.lang.NumberFormatException: For input string: "1.2365478963012547E22"'} |