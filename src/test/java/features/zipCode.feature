Feature: Zip Code Tests
  @wip
  Scenario: Basic GET Test
    Given url "http://api.zippopotam.us/us/22031"
    When method GET
    Then status 200
    And print response
    # Response response = RestAssured.given(......)
    Then match response.country == 'United States'
    Then match response.places[0].state == "Virginia"