# Showoff Widget API wrapper

Simple showoff widget API wrapper.

## Installation

Follow these easy steps to install and start the app:

### Set up Rails app

First, install the gems required by the application:

    bundle

### Set up .env file

Before running the application you will need to create a .env file in app root directory and declare the following variables:

```
  CLIENT_ID
  CLIENT_SECRET
```

### Test Widget API wrapper

Run the application Rspec tests:

```
  bundle exec rspec
```

### Start the app

Start the Rails app:

    bundle exec rails server

## Documentation

  How to consume Showoff API wrapper:

- [Authentication methods](docs/authentication.md)
- [User methods](docs/user.md)
- [Widget methods](docs/widget.md)