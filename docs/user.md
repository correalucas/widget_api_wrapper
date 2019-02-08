# *Showoff Widget API wrapper:* User

To Signup you will need to do a POST to `/signup` with the following attributes:

```ruby
  # POST /signup
  # Parameters:
  "user": {
    "first_name": "A",
    "last_name": "User",
    "password": "password",
    "email": "michael+2@showoff.ie",
    "image_url": "https://static.thenounproject.com/png/961-200.png"
  }
```
This POST will return your data and Token like this:

```ruby
  {
    "user": {
      "id": 3,
      "name": "A User",
      "images": {
        "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/missing/missing.jpg",
        "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/missing/missing.jpg",
        "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/missing/missing.jpg",
        "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/missing/missing.jpg"
      },
      "first_name": "A",
      "last_name": "User",
      "date_of_birth": null,
      "email": "michael+2@showoff.ie",
      "active": true
    },
    "token": {
      "access_token": "475567c781beffe3a97f899d95b15b252d82368141662a25684eed56f8c75cf1",
      "token_type": "Bearer",
      "expires_in": 2592000,
      "refresh_token": "fbdeace27b089736f9ee9856b35daeff4a7fd24b813ff65f7cdaa87738846962",
      "scope": "basic",
      "created_at": 1549368517
    }
  }
```

To update your user you will need to do a PUT to `/my_profile` and can use the following parameters:

```ruby
  # PUT /my_profile

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # Parameters:
  {
    "user": {
      "first_name" : "Another",
      "last_name" : "User",
      "date_of_birth" : 1464083530,
      "image_url": "https://static.thenounproject.com/png/961-200.png"
    }
  }
```
This POST will return your data like this:

```ruby
  {
    "user": {
      "id": 3,
      "name": "Another User",
      "images": {
        "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/small/961-200.png?1549368517",
        "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/medium/961-200.png?1549368517",
        "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/large/961-200.png?1549368517",
        "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/original/961-200.png?1549368517"
      },
      "first_name": "Another",
      "last_name": "User",
      "date_of_birth": 1464083530,
      "email": "michael+2@showoff.ie",
      "active": true
    }
  }
```

To view your user you will need to do a GET to `/my_profile` using your token:

```ruby
  # GET /my_profile

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024
  ```

This GET will return your data like this:

```ruby
  {
    "user": {
      "id": 3,
      "name": "Another User",
      "images": {
        "small_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/small/961-200.png?1549368517",
        "medium_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/medium/961-200.png?1549368517",
        "large_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/large/961-200.png?1549368517",
        "original_url": "https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/000/003/original/961-200.png?1549368517"
      },
      "first_name": "Another",
      "last_name": "User",
      "date_of_birth": 1464083530,
      "email": "michael+2@showoff.ie",
      "active": true
    }
  }
```

To view another user profile you will need to do a GET to `/users/:id` using your token and a `:id` parameter:

```ruby
  # GET /users/:id

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # Parameter:
  {
    "id": 3
  }
  ```

This GET will return the user data like this:

```ruby
  {
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
    }
  }
```

To change your user password you will need to do a POST to `/change_password` using your token and the following parameters:

```ruby
  # POST /change_password

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # Parameters:
  {
    "user": {
      "current_password": "password",
      "new_password": "new_password"
    }
  }
```

This POST will return the new token data like this:

```ruby
  {
    "token": {
      "access_token": "b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024",
      "token_type": "Bearer",
      "expires_in": 2592000,
      "refresh_token": "d0362021d448c41d4db4037f5f17bca047b02542d061dae3851a4ea7d25645f2",
      "scope": "basic",
      "created_at": 1549368579
    }
  }
```

To check user email you will need to do a GET to `/check_email` using `:email` parameter:

```ruby
  # GET /check_email

  # Parameters:
  {
    "user": {
      "email": "my_email@example.com"
    }
  }
```

This POST will return the new token data like this:

```ruby
  {
    "available": true
  }
```

To reset user password you will need to do a POST to `/reset_password` using `:email` parameter:

```ruby
  # GET /check_email

  # Parameters:
  {
    "user": {
      "email": "my_email@example.com"
    }
  }
```

This POST will return the new token data like this:

```ruby
  {
    "code": 0,
    "message": "Password reset email sent to my_email@example.com. Please check your email address for further instructions.",
    "data": null
  }
```
