---
title: Logins
---


## Logins

The `/api/logins/{ login_id }` endpoint implements RESTful methods to let you interact with your data.

### List

To retrieve the list of logins from your account, simply send a `GET` request to the base logins' endpoint, no extra parameters are required.

`GET https://learninglogin.com/api/logins`

#### Sample response body

~~~json
[
    {
      "id":123456,
      "first_name": 'Demo',
      "last_name": 'Login',
      "username": 'demo_login',
      "email": 'demo_login@learninglocin.com',
      "role": 'Global Publisher'
    },
    {
      "id":123457,
      "first_name": 'Demo',
      "last_name": 'Login2',
      "username": 'demo_login2',
      "email": 'demo_login2@learninglocin.com',
      "role": 'Global Publisher'
    }
]
~~~

### Create

To create a new login, send a `POST` request to the base logins' endpoint with the following parameters:

| Name        | Type   | Required? | Description                                        |
|-------------|--------|-----------|----------------------------------------------------|
| first_name  | string | yes       | Login's first name                                 |
| last_name   | string | yes       | Login's last name                                  |
| email       | string | yes       | Login's email address                              |
| username    | string | yes       | Login's username, required to access the system    |
| password    | string | yes       | Login's password                                   |
| role_string | string | yes       | Login's role: Can be 'Trainee', 'Global publisher' |
| udf_list    | array  | no        | List of tags associated to the login               |

#### Sample request body

~~~json
  {
    login: {
      "first_name":'first',
      "last_name":'last',
      "email":'login@mail.com',
      "username":'username',
      "udf_list": ['accounting', 'service'],
      "role_string": 'Trainee',
      "password": 'abc123'
    }
  }
~~~

#### Sample response body

When the login is successfully created, our API will send a `JSON` response with the newly created login's information:

~~~json
  {
    "id": 2,
    "first_name": 'first',
    "last_name": 'last',
    "username": 'username',
    "email": 'ememe@lsl.de',
    "role": 'Trainee'
  }
~~~

If something goes wrong, the API will respond with a `422` error code and the error's description in `JSON` format:

~~~json
  {
    "errors": [
      'Login role can't be blank',
      'Login password can't be blank'
    ]
  }
~~~

### Update

To update an existing login, send a `PUT` request to the logins' endpoint `/api/logins/{ login_id }` with the parameters you want to update, the same [parameters used when creating a login](#create) are supported.


#### Sample request body

An example request body to update a login's name might be:

~~~json
  {
    "login": {
      first_name: 'New name'
    }
  }
~~~

#### Sample response body

When the login is successfully updated, our API will send a `JSON` response with the updated login's information:

~~~json
  {
    "id": 2,
    "first_name": 'New name',
    "last_name": 'last',
    "username": 'username',
    "email": 'ememe@lsl.de',
    "role": 'Trainee'
  }
~~~

If something goes wrong, the API will respond with a `422` error code and the error's description in `JSON` format:

~~~json
  {
    "errors": [
      'First name can't be blank'
    ]
  }
~~~

### Remove

To remove a login, send a `DELETE` request to the logins' endpoint `/api/logins/{ login_id }`, no parameters are required.

When the login is successfully removed, our API will send an empty `JSON` response.

If something goes wrong, the API will respond with a `422` error code and an empty `JSON` response.

