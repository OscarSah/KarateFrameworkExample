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

  Scenario: how to reach array objects
    * def spartans =
    """
    [
        {
            "id": 122,
            "name": "Severus",
            "gender": "Male",
            "phone": 8877445596
        },
        {
            "id": 2,
            "name": "Oscar King",
            "gender": "Male",
            "phone": 4218971348
        },
        {
            "id": 3,
            "name": "Fidole",
            "gender": "Male",
            "phone": 6105035231
        },
        {
            "id": 4,
            "name": "Paige",
            "gender": "Female",
            "phone": 3786741487
        },
        {
            "id": 5,
            "name": "Blythe",
            "gender": "Female",
            "phone": 3677539542
        },
        {
            "id": 6,
            "name": "Tedmund",
            "gender": "Male",
            "phone": 2227140732
        },
        {
            "id": 7,
            "name": "Hershel",
            "gender": "Male",
            "phone": 5278678322
        }
    ]
    """
    * print spartans[1].name
    # 1 is second element, zero indexed
    * print spartans[1].gender





