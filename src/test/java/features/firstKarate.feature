Feature: A brief description of the what is being tested

  Background:
    # this is optional
   # each step is run before each scenario
  # define variables which are global

  Scenario: printing test
    Given print "first hour of Karate Framework"
    When print "we will work","so many hours"
    * print 5+10

  Scenario: defining variables
    Given def age = 45
    When def name = 'Oscar'
    And print name, 'is', age, ' years old'
  Scenario: defining more complex variables: json object
    * def student = {'name':'Sam','owes_tuition':'false'}
    * print student
    * print student.name
    #printing with path
    * print student.owes_tuition
  @wip
  Scenario: more json objects
    * def singleSpartan =
    """
    {
    "id": 9,
    "name": "Florrie",
    "gender": "Female",
    "phone": 1702025787
    }
    """
    * print singleSpartan.id
    * print singleSpartan.gender
    * print singleSpartan.phone
