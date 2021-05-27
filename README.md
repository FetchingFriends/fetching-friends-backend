# Fetching Friends

### Jump To
- [About](#about)
- [Getting Started](#getting-started)
- [Setup](#setup)
- [Running the tests](#running-the-tests)
- [Database Schema](#database-schema)
- [Endpoint Documentation](#endpoint-documentation)
- [Authors](#authors)

## About 

Fetching Friends is an application designed to help you find your next pet! Future pet parents have the ability to search through the available pets based on certain criteria you are looking for. Once a desired pet is found, you can submit an application straight to the owner to apply for your furry friend. This application also caters towards the needs of someone who has a pet to offer for adoption by giving them a platform to post their animals.

This repo is holds the back-end for Fetching Friends and is consumed by our front-end. The front-end repo can be found [here](https://github.com/FetchingFriends/fetching-friends-ui).

[Fetching Friends Back-end Heroku](https://fetching-friends-backend.herokuapp.com/)

## Getting Started

These instructions will give you a copy of the project up and running on
your local machine for development and testing purposes. 

### Setup

**Version Requirements**
* ruby 2.5.3
* rails 5.2

1. Clone this repo:

       $ git clone git@github.com:FetchingFriends/fetching-friends-backend.git
2. `cd` into `fetching-friends-backend`
3. Run `bundle install`
4. Run `rails db:{create,migrate,seed}`

### Running the tests

To check out our in-depth test suite, run:

    $ bundle exec rspec 


## Database Schema 

 ![alt_text](https://user-images.githubusercontent.com/71908665/119854480-5562a280-bece-11eb-9031-211ffeded394.png)

## Endpoint Documentation

| HTTP verbs | Paths  | Used for | Output |
| ---------- | ------ | -------- | ------:|
| GET | /api/v1/pets?type=dog | Get all pets of a given type | [json](#pets-by-type) |
| GET | /api/v1/user/:id/pets | Get all pets belonging to a user | [json](#pets-by-user) |
| GET | /api/v1/users/:user_id | Get a user, and users pets, favorited  pets, and applications| [json](#all-user-data) |
| POST | /api/v1/users | Create a new user | [json](#create-user) |
| POST | /api/v1/pets | Create a new pet | [json](#create-pet) |
| DELETE | /api/v1/pets/:pet_id  | Delete a pet | [details](#delete-a-pet) |
| DELETE | /api/v1/application/:application_id  | Delete an application | [details](#delete-an-application) |
| PUT | /api/v1/application/:application_id | Update an application | [json](#update-an-application)
| PUT | /api/v1/pet/:pet_id | Update a pet | [json](#update-a-pet)

## Authors

### Backend Team
* **Jacob Arellano** -- [GitHub](https://github.com/jakejakearell) |
  [LinkedIn](https://www.linkedin.com/in/jacob-arellano-ab2890207/)
* **Arika Blenker** -- [GitHub](https://github.com/arikalea) |
  [LinkedIn](https://www.linkedin.com/in/arika-blenker/)
* **Doug Welchons** -- [GitHub](https://github.com/DougWelchons) |
  [LinkedIn](https://www.linkedin.com/in/douglas-welchons/)
  
### Frontend Team  
* **Joshua Aragon** -- [GitHub](https://github.com/josharagon) |
  [LinkedIn](https://www.linkedin.com/in/joshua-aragon-854275206/)
* **Matt MvVey** -- [GitHub](https://github.com/mattmcvey) |
  [LinkedIn](https://www.linkedin.com/in/matt-mcvey-810a7256/)
* **Owen Hallgren** -- [GitHub](https://github.com/owenhallgren) |
  [LinkedIn](https://www.linkedin.com/in/owen-hallgren-896276206/)
  
See also the list of [contributors](https://github.com/FetchingFriends/fetching-friends-backend/graphs/contributors)

