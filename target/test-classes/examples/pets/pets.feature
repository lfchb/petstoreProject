Feature: Pets

  Background:
    * url 'https://petstore.swagger.io/v2/'
    * def updatePet = karate.get('updatePet')


  Scenario: Create a pet
    * def isValidName = function(name) {return /[A-Za-z0-9]+/.test(name) && name.length <= 50;}
    * def isValidLength = function(field, maxLength) {return field.length <= maxLength;}
    * def validatePetData = function(petData) { if (!isValidName(petData.name)) karate.fail('El nombre de la mascota no es válido'); if (!isValidLength(petData.name, 50)) karate.fail('El nombre de la mascota excede el máximo permitido de 50 caracteres');}
    * def create_pet_request =
    """
    {
      "id": 0,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "fido",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    * validatePetData(create_pet_request)
    Given path '/pet'
    And request create_pet_request
    When method post
    Then status 200

    * def expectedName = create_pet_request.name
    * def expectedJob = create_pet_request.status

    And match response.name == expectedName
    And match response.status == expectedJob
    And match response ==
    """
      {
         "id": #number,
         "category":{
            "id":0,
            "name":"string"
         },
         "name":"#string",
         "photoUrls":[
            "string"
         ],
         "tags":[
            {
               "id":0,
               "name":"string"
            }
         ],
         "status":"#string"
      }
    """

  Scenario: Search a pet
    * def create_pet_request =
    """
    {
      "id": 0,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "rocko",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    Given path '/pet'
    And request create_pet_request
    When method post
    Then status 200

    * def petId = response.id
    * print 'pet id is: ', petId

    Given path '/pet/', petId
    When method get
    Then status 200
    And match response.id == petId


  Scenario: Update a pet
    * def create_pet_request =
    """
    {
      "id": 0,
      "category": {
        "id": 0,
        "name": "string"
      },
      "name": "pulgoso",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 0,
          "name": "string"
        }
      ],
      "status": "available"
    }
    """
    Given path '/pet'
    And request create_pet_request
    When method post
    Then status 200

    * def petId = response.id
    * def stringIdPet = karate.toString(petId)
    * karate.set('updatePet', petId)
    * def idPetUpdate = karate.get('updatePet')
    * print 'pet id is: ', idPetUpdate

    Given path '/pet', petId
    And header accept = 'application/json'
    And header content-type = 'application/x-www-form-urlencoded'
    And param name = 'rufo'
    And param status = 'sold'
    When method POST
    Then status 200
    And match response.message == stringIdPet


  Scenario: Search a pet by status and id
    * def idPetUpdate = karate.get('updatePet')

    Given path '/pet/findByStatus'
    And param status = ['sold']
    And param id = idPetUpdate
    When method get
    Then status 200