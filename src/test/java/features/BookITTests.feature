Feature: BookIT API Tests

  Background: defining global variables
    * def bookItUrl = 'https://cybertek-reservation-api-qa3.herokuapp.com'
    * def AuthFeature = call read('classpath:features/BookITAuth.feature')
    * def accessToken = AuthFeature.token
    # go get me Feature file, inside feature file we have token variable, we are calling for that
    * def studentInfo =
    """
    {
  "firstName": "Ase",
  "lastName": "Norval",
  "role": "student-team-leader",
  "id": 140
}
    """
    Scenario: get user information
      Given url bookItUrl
      And path 'api/students/me'
      And header Authorization = 'Bearer '+ accessToken
      And header Accept = 'application/json'
      When method get
      Then status 200
      And match response == studentInfo

  Scenario: get campus info and verify with the Data file expected
    Given url bookItUrl
    And path 'api/campuses/my'
    And header Authorization = 'Bearer '+ accessToken
    And header Accept = 'application/json'
    When method get
    Then status 200
    # We will read expected json file and store it to a variable
    And def expectedCampuses = read ('classpath:data/campuses.json')
    And match response == expectedCampuses






