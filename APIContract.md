# Fetching Friends API Contract

## Endpoints

| HTTP verbs | Paths  | Used for | Output |
| ---------- | ------ | -------- | ------:|
| GET | /api/v1/pets/:type | Get all pets of a given type | [json](#pets-by-type) |
| GET | /api/v1/users/:user_id | Get a user, and users pets, favorited  pets, and applications| [json](#all-user-data) |
| POST | /api/v1/users | Create a new user | [json](#create-user) |
| POST | /api/v1/pets | Create a new pet | [json](#create-pet) |
| DELETE | /api/v1/pets/:pet_id  | Delete a pet | [details](#delete-a-pet) |
| DELETE | /api/v1/application/:application_id  | Delete an application | [details](#delete-an-application) |
| PUT | /api/v1/application/:application_id | Update an application | [json](#update-an-application)
| PUT | /api/v1/pet/:pet_id | Update a pet | [json](#update-a-pet)

## JSON Responses

## Pets by Type
`GET /api/v1/pets/dog`
  ```json
  {
    "data": [
      {
        "id": "1",
          "type": "pet",
          "attributes": {
            "type": "dog",
            "user_id": 5,
            "name": "Max",
            "age": 1,
            "breed": "Lab",
            "description": "Good Boy",
            "gender": "M",
            "fix": true,
            "house trained": true,
            "good with kids": true,
            "good with other pets": true,
            "photo_url_1": "URL Path",
            "photo_url_2": "URL Path",
            "photo_url_3": "URL Path",
          }
      },
      {
        "id": "4",
          "type": "pet",
          "attributes": {
            "user_id": 2,
            "name": "Lassy",
            "age": 5,
            "breed": "Boxer",
            "description": "Very nice and lovable",
            "gender": "F",
            "fix": false,
            "house trained": true,
            "good with kids": true,
            "good with other pets": true,
            "photo_url_1": "URL Path",
            "photo_url_2": "URL Path",
            "photo_url_3": "URL Path",
          }
      },
      {
        "id": "6",
          "type": "pet",
          "attributes": {
            "user_id": 9,
            "name": "Sport",
            "age": 0,
            "breed": "Lab",
            "description": "Good Boy",
            "gender": "M",
            "fix": false,
            "house trained": false,
            "good with kids": true,
            "good with other pets": true,
            "photo_url_1": "URL Path",
            "photo_url_2": "URL Path",
            "photo_url_3": "URL Path",
          }
      }
    ]
  }
  ```

## All User Data
`GET /api/v1/users?email=<user_email>`
  ```json
  {
    "data": {
      "id": "1",
      "type": "full_user",
      "attributes": {
        "username": "Cool Cat",
        "email": "my@email.com",
        "pets": [
          {
            "id": "1",
            "user_id": "1",
            "name": "Max",
            "age": "1",
            "pet_type": "dog",
            "breed": "Lab",
            "description": "Good Boy",
            "gender": "M",
            "fixed": true,
            "house trained": true,
            "photo_url_1": "URL Path",
            "photo_url_2": "URL Path",
            "photo_url_3": "URL Path",
            "good with kids": true,
            "good with other pets": true,
            "created_at": "time stamp",
            "updated_at": "time stamp"
          },
          ... additional pet objects
        ],
        "favorites": [
          {
            "id": "4",
            "user_id": "5",
            "name": "Sparky",
            "age": "2",
            "pet_type": "cat",
            "breed": "calico",
            "description": "Very nice",
            "gender": "M",
            "fixed": false,
            "house trained": true,
            "photo_url_1": "URL Path",
            "photo_url_2": "URL Path",
            "photo_url_3": "URL Path",
            "good with kids": true,
            "good with other pets": false,
            "created_at": "time stamp",
            "updated_at": "time stamp"
          },
          ... additional pet objects
        ],
        "application": [
          {
            "id": "4",
            "user_id": "1",
            "pet_id": "14",
            "status": "pending",
            "description": "I would be good because...",
            "created_at": "time stamp",
            "updated_at": "time stamp"
          },
          ... additional application objects
        ],
        "pet_applications": [
          {
            "id": "4",
            "user_id": "1",
            "pet_id": "14",
            "status": "pending",
            "description": "I would be good because...",
            "created_at": "time stamp",
            "updated_at": "time stamp"
          },
          ... additional application objects
        ],
      }
    }
  }
  ```

## Create New User
`POST /api/v1/users`
  ```json
  {
    "data": {
      "id": "1",
      "type": "User",
      "attributes": {
        "username": "My Name",
        "email": "my@email.com"
      }
    }
  }
  ```

## Create New Pet
`POST /api/v1/pets`
  ```json
  {
    "data": {
      "id": "1",
      "type": "pet",
      "attributes": {
        "user_id": 9,
        "name": "Sport",
        "age": 0,
        "breed": "Lab",
        "description": "Good Boy",
        "gender": "M",
        "fix": false,
        "house trained": false,
        "good with kids": true,
        "good with other pets": true,
        "photo_url_1": "URL Path",
        "photo_url_2": "URL Path",
        "photo_url_3": "URL Path",
      }
    }
  }
  ```

## Delete a Pet
`DELETE /api/v1/pets/:pet_id`
- remove pet from database if the id matches

## Delete an Application
`DELETE /api/v1/applications/:application_id`
- remove pet from database if the id matches