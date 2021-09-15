# GAME SAFARIS RESERVATIONS API

Game Safaris Reservations is A RESTFUL API built with Ruby on Rails. It makes use of JWT to implement Authentication and Authorization features. This is a full stack application, where users can access a list of Game Safaries activities from which they can choose an activity and make a reservation. The application can be accessed from the front end using the [Game Safaris Reservations](https://galisoft-gamesafaris.netlify.app) front end feature built using React and Redux.

## Home page of a logged in user.

## Built With

- ruby 3.0.1
- Rails 6.1.4
- Postgres 13.3
- RSpec-rails

## Live Demo

[Game Safaris Reservations](https://galisoft-gamesafaris-back-end.herokuapp.com/)

## API END POINTS

### Base URL: {HOST-URL}/api/v1

Below is a list of the end points and their respective use.

```
END POINT                       USE
```

```
POST/register                   Sign up
```

```
POST/sign_in                    Sign in
```

```
GET/users                       List all users
```

```
GET/users/:id                   Show a user
```

```
DELETE/users/:id                Update a user
```

```
PATCH/users/:id                 Update a user
```

```
GET/activities                  List all activities
```

```
POST/activities                 Create activity
```

```
GET/activities/:id              Show a single activity
```

```
PATCH/activities/:id            Update activity
```

```
DELETE/activities/:id           Delete activity
```

```
GET/reservations                List all reservations
```

```
PATCH/reservations/:id          Update a reservation
```

```
DELETE/reservations/:id         Delete a reservation
```

## Getting Started

### Prerequisites

- ruby 3.0.1
- Rails 6.1.4
- Postgres >=13.3

### Clone the repo:

```
$ git clone https://github.com/gango-anan/game-park-reservations-api.git

```

### Setup

Install the needed gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
   rails db:seed
```

### Run tests

Finally, run the test suite to verify that everything is working correctly with:

```
    rspec
```

### Usage

If the test suite passes, you'll be ready to run the app in a local server.

Start server with:

```
    rails server
```

### In your browser, type:

```
    http://localhost:3000
```

## Author

GALIWANGO ANANIYA

- GitHub: [@gango-anan](https://github.com/gango-anan)
- Twitter: [@gango_anan](https://twitter.com/gango_anan)
- LinkedIn: [@galiwango-ananiya](https://www.linkedin.com/in/galiwango-ananiya/)

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/gango-anan/game-park-reservations-api/issues).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- [Microverse Inc](https://www.microverse.org/)
- [Rails guides](https://guides.rubyonrails.org/)

## 📝 License

This project is [MIT](https://github.com/gango-anan/game-park-reservations-api/blob/master/LICENSE) licensed.
