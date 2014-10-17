---
title: Users
---

## Users

The `/api/users/{ user_id }` endpoint implements RESTful methods to let you interact with your data.

### List

To retrieve the list of users from your account, simply send a `GET` request to the base users' endpoint, no extra parameters are required.

`GET https://learninglogin.com/api/users`

#### Sample response body

```
  [
    {
      "id":123456,
      "first_name": "Demo",
      "last_name": "User",
      "username": "demo_user",
      "email": "demo_user@learninglocin.com",
      "role": "Global Publisher"
    },
    {
      "id":123457,
      "first_name": "Demo",
      "last_name": "User2",
      "username": "demo_user2",
      "email": "demo_user2@learninglocin.com",
      "role": "Global Publisher"
    }
  ]
```

### Create

To create a new user, send a `POST` request to the base users' endpoint with the following parameters:

| Name        | Type   | Required? | Description                                       |
|-------------|--------|-----------|---------------------------------------------------|
| first_name  | string | yes       | User's first name                                 |
| last_name   | string | yes       | User's last name                                  |
| email       | string | yes       | User's email address                              |
| username    | string | yes       | User's username, required to access the system    |
| password    | string | yes       | User's password                                   |
| role_string | string | yes       | User's role: Can be 'Trainee', 'Global publisher' |
| udf_list    | array  | no        | List of tags associated to the user               |

#### Sample request body

```
  {
    user: {
      login_attributes: {
        first_name:'first',
        last_name:'last',
        email:'user@mail.com',
        username:'username',
        udf_list: ['accounting', 'service'],
        role_string: 'Trainee',
        password: 'abc123'
      }
    }
  }
```

#### Sample response body

When the user is successfully created, our API will send a `JSON` response with the newly created user's information:

```
  {
    "id": 2,
    "first_name": "first",
    "last_name": "last",
    "username": "username",
    "email": "ememe@lsl.de",
    "role": "Trainee"
  }
```

If something goes wrong, the API will respond with a `422` error code and the error's description in `JSON` format:

```
  {
    "errors": [
      "Login role can't be blank", 
      "Login password can't be blank"
    ]
  }
```

### Update

To update an existing user, send a `PUT` request to the users' endpoint `/api/users/{ user_id }` with the parameters you want to update, the same [parameters used when creating a user](#create) are supported.


#### Sample request body

An example request body to update a user's name might be:

```
  {
    user: {
      first_name: 'New name'
    }
  }
```

#### Sample response body

When the user is successfully updated, our API will send a `JSON` response with the updated user's information:

```
  {
    "id": 2,
    "first_name": "New name",
    "last_name": "last",
    "username": "username",
    "email": "ememe@lsl.de",
    "role": "Trainee"
  }
```

If something goes wrong, the API will respond with a `422` error code and the error's description in `JSON` format:

```
  {
    "errors": [
      "First name can't be blank"
    ]
  }
```

### Remove

To remove a user, send a `DELETE` request to the users' endpoint `/api/users/{ user_id }`, no parameters are required.

When the user is successfully removed, our API will send an empty `JSON` response.

If something goes wrong, the API will respond with a `422` error code and an empty `JSON` response.

