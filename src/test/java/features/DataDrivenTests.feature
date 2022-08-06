Feature: Data Driven tests

  Scenario Outline: get token for users
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method get
    Then status 200
    # And print response
    And def token = response.accessToken
    * print token
    Examples:
      | email                       | password       |
      | sbirdbj@fc2.com             | asenorval      |
      | mnewbatt8o@utexas.edu       | opalcave       |
      | wamiss8p@businesswire.com   | olagrills      |
      | mstacey8r@imdb.com          | skylargiblin   |
      | ecrasford8s@dagondesign.com | bricesiddell   |
      | gwilloway8t@nih.gov         | morrievondrach |

  @wip
  Scenario Outline: get token for users withCSV file
    Given url 'https://cybertek-reservation-api-qa3.herokuapp.com'
    And path 'sign'
    And header Accept = 'application/json'
    And param email = '<email>'
    And param password = '<password>'
    When method get
    Then status 200
    # And print response
    And def token = response.accessToken
    * print token
    Examples:
    |read ('data/users.csv')|
    # advantage of Karate, you can provide file to your scenarios directly