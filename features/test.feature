Feature: BeerCans

  In order to know how many cans remain
  A owner
  Should be able to see remaining cans

  Scenario Outline: Drink beer cans
    Given I have <opening_balance> beer can
    And I have drunk <processed> beer cans
    When I go to my fridge
    Then I should see <in_stock> beer cans
  Examples:
    | opening_balance   | processed   | in_stock   |
    | 123               | 50          | 73         |
    | 200               | 60          | 140        |
    | 650               | 600         | 50         |
    | 1                 | 1           | 0          |