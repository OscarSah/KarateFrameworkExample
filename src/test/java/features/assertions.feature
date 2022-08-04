Feature: Assertions Test
  Scenario: single variable matching
    * def name = 'Scolfield'
    * match name == 'Scolfield'
    # similar to Assert.assertEquals(name,"Scolfield")
   * match name != 'Oscar'

  Scenario: asserting json objects
    * def spartan =
    """
       {
            "id": 6,
            "name": "Tedmund",
            "gender": "Male",
            "phone": 2227140732
        }
    """
    * match spartan.name == "Tedmund"