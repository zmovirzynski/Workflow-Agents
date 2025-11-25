Feature: User API Tests

  Scenario: Get user by ID
    Given url 'https://api.example.com'
    And path '/users/1'
    When method get
    Then status 200
    And match response.name == 'John Doe'
    And match response.email contains '@example.com'

  Scenario: Create new user
    Given url 'https://api.example.com'
    And path '/users'
    And request { name: 'Jane Doe', email: 'jane@example.com' }
    When method post
    Then status 201
    And match response.id == '#notnull'
    And match response.name == 'Jane Doe'

  Scenario: Update user
    Given url 'https://api.example.com'
    And path '/users/1'
    And request { name: 'John Updated' }
    When method put
    Then status 200
    And match response.name == 'John Updated'

  Scenario: Delete user
    Given url 'https://api.example.com'
    And path '/users/1'
    When method delete
    Then status 204
