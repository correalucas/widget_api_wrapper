# *Showoff Widget API wrapper:* Authentication

To get the API token you will need to do a POST to `auth/login` with your `:username` and `:password`:

```ruby
  # POST /auth/login
  # Parameters:
  {
    username: 'username@example.com',
    password: 'yourpassword'
  }
```
This POST will return your Token like this:

```ruby
  {
    "token": {
      "access_token": "479c8407d69e5bbc5079936e13314b50971d7028a11994a3be83c8f89027835f",
      "token_type": "Bearer",
      "expires_in": 2592000,
      "refresh_token": "6399bbcf509079f7565a30d06de245e5414e554d74328181f7fe4313bb256c29",
      "scope": "basic",
      "created_at": 1549368326
    }
  }
```

To refresh a expired token you will need to do a POST to `auth/refresh` with the `:refresh_token` attribute returned by `auth/login` request:

```ruby
  # POST auth/refresh

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # Parameters:
  {
    refresh_token: '6399bbcf509079f7565a30d06de245e5414e554d74328181f7fe4313bb256c29'
  }
```

This POST will return your Token like this:

```ruby
  {
    "token": {
      "access_token": "479c8407d69e5bbc5079936e13314b50971d7028a11994a3be83c8f89027835f",
      "token_type": "Bearer",
      "expires_in": 2592000,
      "refresh_token": "6399bbcf509079f7565a30d06de245e5414e554d74328181f7fe4313bb256c29",
      "scope": "basic",
      "created_at": 1549368326
    }
  }
```

To revoke a token you will need to do a POST to `auth/logout` with your `:access_token`:

```ruby
  # POST auth/logout

  # Headers:
  # Authorization Bearer b530f9ad13a061b36aa342b255608e18960db09cfd977cab8c1de9a0f8226024

  # Parameters:
  {
    token: '479c8407d69e5bbc5079936e13314b50971d7028a11994a3be83c8f89027835f'
  }
```

This post will return the message:

```ruby
  {
    "message": "Token Successfully Revoked"
  }
```
