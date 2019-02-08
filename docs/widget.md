# *Showoff Widget API wrapper:* Widget

To view visible widgets you will need to do a GET to `/widgets/visible`:

```ruby
  # GET /widgets/visible

  # You can also pass a :term parameter to filter results
  # Parameter
  {
    "term": "A"
  }
  ```

This GET will return your data like this:

```ruby
  {
   "widgets": [
      {
        "id": 4,
        "name": "A Visible Widget",
        "description": "Widget 1",
        "kind": "visible",
        "user": {
          "id": 1,
          "name": "A User",
          "images": {
            "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/small/961-200.png?1549366177",
            "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/medium/961-200.png?1549366177",
            "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/large/961-200.png?1549366177",
            "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/original/961-200.png?1549366177"
          },
          "first_name": "A",
          "last_name": "User"
        },
        "owner": false
      }
    ]
  }
```

To view widgets you will need to do a GET to `/widgets` using your token:

```ruby
  # GET /widgets

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024
  ```

This GET will return your data like this:

```ruby
  {
    "widgets": [
      {
        "id": 5,
        "name": "A Hidden Widget",
        "description": "Widget 1",
        "kind": "hidden",
        "user": {
          "id": 3,
          "name": "Another User",
          "images": {
            "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/small/961-200.png?1549368535",
            "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/medium/961-200.png?1549368535",
            "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/large/961-200.png?1549368535",
            "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/original/961-200.png?1549368535"
          },
          "first_name": "Another",
          "last_name": "User",
          "date_of_birth": 1464083530,
          "email": "michael+2@showoff.ie",
          "active": true
        },
        "owner": true
      }
    ]
  }
```

To view your widgets you will need to do a GET to `/my_widgets` using your token:

```ruby
  # GET /widgets

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # You can also pass a :term parameter to filter results
  # Parameter
  {
    "term": "visible"
  }
  ```

This GET will return your data like this:

```ruby
  {
    "widgets": [
      {
        "id": 3,
        "name": "A Hidden Widget",
        "description": "Widget 1",
        "kind": "hidden",
        "user": {
          "id": 1,
          "name": "A User",
          "images": {
            "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/small/961-200.png?1549366177",
            "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/medium/961-200.png?1549366177",
            "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/large/961-200.png?1549366177",
            "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/original/961-200.png?1549366177"
          },
          "first_name": "A",
          "last_name": "User",
          "date_of_birth": null,
          "email": "michael@showoff.ie",
          "active": true
        },
        "owner": true
      },
      {
        "id": 4,
        "name": "A Visible Widget",
        "description": "Widget 1",
        "kind": "visible",
        "user": {
          "id": 1,
          "name": "A User",
          "images": {
            "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/small/961-200.png?1549366177",
            "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/medium/961-200.png?1549366177",
            "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/large/961-200.png?1549366177",
            "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/original/961-200.png?1549366177"
          },
          "first_name": "A",
          "last_name": "User",
          "date_of_birth": null,
          "email": "michael@showoff.ie",
          "active": true
        },
        "owner": true
      }
    ]
  }
}
```

To view another user widgets you will need to do a GET to `/users/:id/widgets` using your token:

```ruby
  # GET /widgets

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # You can also pass a :term parameter to filter results
  # Parameter
  {
    "id": 1
    "term": "A"
  }
  ```

This GET will return your data like this:

```ruby
  {
    "widgets": [
      {
        "id": 4,
        "name": "A Visible Widget",
        "description": "Widget 1",
        "kind": "visible",
        "user": {
          "id": 1,
          "name": "A User",
          "images": {
            "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/small/961-200.png?1549366177",
            "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/medium/961-200.png?1549366177",
            "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/large/961-200.png?1549366177",
            "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/001/original/961-200.png?1549366177"
          },
          "first_name": "A",
          "last_name": "User",
          "date_of_birth": null,
          "email": "michael@showoff.ie",
          "active": true
        },
        "owner": true
      }
    ]
  }
}
```

To create a widget you will need to do a POST to `/widgets` with the following attributes:

```ruby
  # POST /widgets

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # Parameters:
  {
    "widget": {
      "name": "A Hidden Widget",
      "description": "Widget 1",
      "kind": "hidden" # or "visible"
    }
  }
```
This POST will return your data and Token like this:

```ruby
  {
    "widget": {
      "id": 5,
      "name": "A Hidden Widget",
      "description": "Widget 1",
      "kind": "hidden",
      "user": {
        "id": 3,
        "name": "Another User",
        "images": {
          "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/small/961-200.png?1549368535",
          "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/medium/961-200.png?1549368535",
          "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/large/961-200.png?1549368535",
          "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/original/961-200.png?1549368535"
        },
        "first_name": "Another",
        "last_name": "User",
        "date_of_birth": 1464083530,
        "email": "michael+2@showoff.ie",
        "active": true
      },
      "owner": true
    }
  }
```

To update your widget you will need to do a PUT to `/widgets/:id` and can use the following parameters:

```ruby
  # PUT /widgets/:id

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # Parameters:
  {
    "id": 3,
    "widget": {
      "name": "An Updated Visible Widget",
      "description": "Widget 1"
    }
  }
```
This PUT will return your data like this:

```ruby
  {
    "widget": {
      "id": 6,
      "name": "An Updated Visible Widget",
      "description": "Widget 1",
      "kind": "visible",
      "user": {
        "id": 3,
        "name": "Another User",
        "images": {
          "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/small/961-200.png?1549368535",
          "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/medium/961-200.png?1549368535",
          "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/large/961-200.png?1549368535",
          "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/original/961-200.png?1549368535"
        },
        "first_name": "Another",
        "last_name": "User",
        "date_of_birth": 1464083530,
        "email": "michael+2@showoff.ie",
        "active": true
      },
      "owner": true
    }
  }
```

To destroy your widget you will need to do a DELETE to `/widgets/:id` and use the following parameter:

```ruby
  # PUT /widgets/:id

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # Parameters:
  {
    "id": 3
  }
```
This DELETE will return your data like this:

```ruby
  {
    "code": 0,
    "message": "Success",
    "data": {
      "widget": null
    }
  }
```
