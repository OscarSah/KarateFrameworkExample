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
    * match spartan.id  == 6

    Scenario: Fuzzy Matching
      # Validating response body
      * def spartan =
    """
       {
            "id": 6,
            "name": "Tedmund",
            "gender": "Male",
            "phone": 2227140732,
            "active": true
        }
    """
      * match spartan.id == '#number'
      * match spartan.name == '#string'
      * match spartan.phone == '#present'
      * match spartan.lastName == '#notpresent'
      * match spartan.active == '#boolean'

      Scenario: contains matching
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

     * def length = spartans.length
     * match length == 7
     * match spartans contains  { "id": 2, "name": "Oscar King", "gender": "Male",   "phone": 4218971348      }
     # contains any: To assert that any of the given elements are present
     * def items = {item : [1,2,3]}
     * match items.item contains any [9,2,8]
     # contains each method
      * def data =
        """
        {foo : [
              {bar : 1 ,
              baz : 'a' },
               { bar : 2 ,
                baz : 'b' },
               {bar : 3 ,
              baz : 'c'}
               ]}
        """
       * match each data.foo == {bar : '#number' , baz : '#string'}
