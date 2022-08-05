Feature: Parameters Example

  Background:
    * def spartanUrl = "http://44.202.119.26:8000"
  
  Scenario: path parameter example
    Given url spartanUrl
    And path "api/spartans"
    When method get
    Then status 200
    And print response

  Scenario: path parameter example
    Given url spartanUrl
    And path "api/spartans"
    And path '2'
    When method get
    Then status 200
    And print response
    * def expectedSpartan =
    """
    {
  "gender": "Male",
  "phone": 4218971348,
  "name": "Oscar King",
  "id": 2
    }
    """
    And match response == expectedSpartan

  @wip
  Scenario: query parameter example
    Given url spartanUrl
    And path "api/spartans/search"
    And param nameContains = 'j'
    And param gender = 'Female'
    And method get
    Then status 200
    * print response
    And match header Content-Type == 'application/json'
    # since we are sending a request to get only females we need verify
    Then match each response.content contains {"gender":"Female"}
    #same verification
    Then match each response.content[*].gender == 'Female'
    Then match response.content[0].name == "Jaimie"
    # if the first spartan is Jaimie
    Then match each response.content[*].phone == '#number'
    # verify each phone number is actually a number
