---
title: Logins
---


## Logins

A `Login` quite simply represents a user in the system. You may create a new `Login` at any time. There are two types of `Logins` that can be created:

- `trainee:` Represents an employee. Only has access to the training center which they use to take courses assigned.</li>
- `admin:` Represents an admnistrator. Can assign courses, access reports, take courses for themselves, and all the administrative features required to manage your LMS.

## Methods


### Index

`GET https://learninglogin.com/api/logins`

To retrieve the list of logins from your account, simply send a `GET` request to the URL above, no extra parameters are required.

#### Sample Response Body

~~~json
[
    {
      "id":123456,
      "first_name": 'Demo',
      "last_name": 'Login',
      "username": 'demo_login',
      "email": 'demo_login@learninglocin.com',
      "role": 'Admin'
    },
    {
      "id":123457,
      "first_name": 'Demo',
      "last_name": 'Login2',
      "username": 'demo_login2',
      "email": 'demo_login2@learninglocin.com',
      "role": 'Trainee'
    }
]
~~~

### Show

`GET https://learninglogin.com/api/logins/:id`

To retrieve the details of a particular login from your account, send a `GET` request to the URL above, no parameters are required.

#### Sample Response Body

~~~json
  {
    "id":123456,
    "first_name": 'Demo',
    "last_name": 'Login',
    "username": 'demo_login',
    "email": 'demo_login@learninglocin.com',
    "role": 'Admin'
  }
~~~

### Create

`POST https://learninglogin.com/api/logins`

To create a new login, send a `POST` request to the URL with the following parameters:

| Name        | Type   | Required? | Description                                             |
|-------------|--------|-----------|---------------------------------------------------------|
| first_name  | string | yes       |                                                         |
| last_name   | string | yes       |                                                         |
| email       | string | yes       |                                                         |
| username    | string | yes       |                                                         |
| password    | string | yes       |                                                         |
| role_string | string | yes       | Permission set for User. Can be ‘Trainee’ or ‘Admin’    |
| udf_list    | array  | no        | List of “tag” metadata associated to user               |

#### Sample Request Body

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

#### Sample Response Body

When a `login` is successfully  created, our API will send a response with the newly created information:

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

Errors will be responded with a `HTTP 422` error code, and an error description.

#### Sample Response Body: Failure

~~~json
  {
    "errors": [
      'Login role can't be blank',
      'Login password can't be blank'
    ]
  }
~~~

### Update

`PUT https://learninglogin.com/api/logins/:id`

To update an existing login, send a `PUT` request to the URL above with the parameters you wish to update with the same format as our #create action.

You can update as many fields as you wish.

#### Sample Request Body

An example request body to update a login's name might be:

~~~json
  {
    "login": {
      first_name: 'New name'
    }
  }
~~~

When the login is successfully updated, our API will send a response with all of the updated login’s information (including fields that were *not* updated).

#### Sample Response Body

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

Errors will be sent with a `HTTP 422 error code, and an error description.

#### Sample Response Body: Failure
~~~json
  {
    "errors": [
      'First name can't be blank'
    ]
  }
~~~

### Delete

`DELETE https://learninglogin.com/api/logins/:id`

To remove a login, send a `DELETE` request to the URL above, no parameters are required.

When the login is successfully removed, our API will send an empty response.

If anything goes wrong, the API will respond with a `HTTP 422` error code and an empty response.

