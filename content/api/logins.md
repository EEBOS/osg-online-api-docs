---
title: Logins
---


## Logins

A `Login` quite simply represents a user in the system. You may create a new `Login` at any time. There are two types of `Logins` that can be created:

- `trainee:` Represents an employee. Only has access to the training center which they use to take courses assigned.
- `admin:` Represents an admnistrator. Can assign courses, access reports, take courses for themselves, and all the administrative features required to manage your LMS.

## Methods


### Index

`https://learninglogin.com/api/logins`

To retrieve the list of logins from your account, simply send a `GET` request to the URL above, no extra parameters are required.

#### JSON Sample Request

`GET https://learninglogin.com/api/logins`

#### JSON Sample Response Body

~~~json
[
    {
      "id":123456,
      "first_name": 'Demo',
      "last_name": 'Login',
      "username": 'demo_login',
      "email": 'demo_login@learninglogin.com',
      "role": 'Admin'
    },
    {
      "id":123457,
      "first_name": 'Demo',
      "last_name": 'Login2',
      "username": 'demo_login2',
      "email": 'demo_login2@learninglogin.com',
      "role": 'Trainee'
    }
]
~~~

#### XML Sample Request

`GET https://learninglogin.com/api/logins.xml`

#### XML Sample Response Body

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<logins type="array">
   <login>
      <id type="integer">123456</id>
      <first-name>Demo</first-name>
      <last-name>Login</last-name>
      <username>demo_login</username>
      <email>demo_login@learninglogin.com</email>
      <role>Admin</role>
   </login>
   <login>
      <id type="integer">123457</id>
      <first-name>Demo</first-name>
      <last-name>Login2</last-name>
      <username>demo_login2</username>
      <email>demo_login2@learninglogin.com</email>
      <role>Trainee</role>
   </login>   
</logins>
~~~

### Show

`https://learninglogin.com/api/logins/:id`

To retrieve the details of a particular login from your account, send a `GET` request to the URL above, only ":id" is required as part of the URL

#### JSON Sample Request

`GET https://learninglogin.com/api/logins/:id`

#### JSON Sample Response Body

~~~json
  {
    "id":123456,
    "first_name": 'Demo',
    "last_name": 'Login',
    "username": 'demo_login',
    "email": 'demo_login@learninglogin.com',
    "role": 'Admin',
    "token": 'bca51ae57828gf8gf7878gfd87'
  }
~~~

#### XML Sample Request

`GET https://learninglogin.com/api/logins/:id.xml`

#### XML Sample Response Body

`GET https://learninglogin.com/api/logins/:id.xml`

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<login>
   <id type="integer">1</id>
   <first-name>Demo</first-name>
   <last-name>Login</last-name>
   <username>demo_login</username>
   <email>demo_login@learninglogin.com</email>
   <role>Admin</role>   
   <token>bca51ae57828gf8gf7878gfd87</token>
</login>
~~~

### Create

`https://learninglogin.com/api/logins`

To create a new login, send a `POST` request to the URL above, it must contain the following parameters:

| Name        | Type   | Required? | Description                                             |
|-------------|--------|-----------|---------------------------------------------------------|
| first_name  | string | yes       |                                                         |
| last_name   | string | yes       |                                                         |
| email       | string | yes       |                                                         |
| username    | string | yes       |                                                         |
| password    | string | yes       |                                                         |
| role_string | string | yes       | Permission set for User. Can be ‘Trainee’ or ‘Admin’    |
| udf_list    | array  | no        | List of “tag” metadata associated to user               |

#### JSON Sample Request Body

`POST https://learninglogin.com/api/logins`

~~~json
  {
    "login": {
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

#### JSON Sample Response Body

When a `login` is successfully  created, our API will send a response with the newly created information:

~~~json
  {
    "id": 2,
    "first_name": 'first',
    "last_name": 'last',
    "username": 'username',
    "email": 'login@mail.com',    
    "role": 'Trainee',
    "token": 'bca51ae57828gf8gf7878gfd87'
  }
~~~

####  JSON Sample Response Body: Failure

Errors will be responded with a `HTTP 422` error code and an error description.

~~~json
  {
    "errors": [
      'Login role can't be blank',
      'Login password can't be blank'
    ]
  }
~~~

#### XML Sample Request Body

`POST https://learninglogin.com/api/logins.xml`

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<login>
   <first-name>first</first-name>
   <last-name>last</last-name>
   <email>login@mail.com</email>
   <username>username</username>
   <udf-list type="array">
     <udf>accounting</udf>
     <udf>service</udf>
   </udf-list>
   <role-string>Trainee</role-string>
   <password>abc123</password>
</login>
~~~

#### XML Sample Response Body

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<login>
   <id type="integer">2</id>
   <first-name>first</first-name>
   <last-name>last</last-name>
   <username>username</username>
   <email>login@mail.com</email>
    <role-string>Trainee</role-string>   
   <token>bca51ae57828gf8gf7878gfd87</token>   
</login>
~~~

#### XML Sample Response Body: Failure

Errors will be responded with a `HTTP 422` error code and an error description.

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<errors type="array">
   <error>First name can't be blank</error>
</errors>
~~~

### Update

`https://learninglogin.com/api/logins/:id`

To update an existing login, send a `PUT` request to the URL above with the parameters you wish to update with the same format as our #create action.

You can update as many fields as you wish.

#### JSON Sample Request Body

`PUT https://learninglogin.com/api/logins/:id`

An example request body to update a login's name might be:

~~~json
  {
    "login": {
      "first_name": 'New name'
    }
  }
~~~

When the login is successfully updated, our API will send a response with all of the updated login’s information (including fields that were *not* updated).

#### JSON Sample Response Body

~~~json
  {
    "id": 2,
    "first_name": 'New name',
    "last_name": 'last',
    "username": 'username',
    "email": 'login@mail.com',
    "role": 'Trainee'
  }
~~~

#### JSON Sample Response Body: Failure

Errors will be sent with a `HTTP 422 error code, and an error description.

~~~json
  {
    "errors": [
      'First name can't be blank'
    ]
  }
~~~

#### XML Sample Request Body

`PUT https://learninglogin.com/api/logins/:id.xml`

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<login>
   <first-name>name</first-name>
</login>
~~~

#### XML Sample Response Body

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<login>
   <id>2</id>
   <first-name>name</first-name>
   <last-name>last</last-name>
   <username>username</username>
   <email>login@mail.com</email>
   <role>Trainee</role>
</login>
~~~

#### XML Sample Response Body: Failure

Errors will be sent with a `HTTP 422 error code, and an error description.

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<errors type="array">
   <error>First name can't be blank</error>
</errors>
~~~

### Delete

`https://learninglogin.com/api/logins/:id`

To remove a login, send a `DELETE` request to the URL above, no parameters are required.

When the login is successfully removed, our API will send an empty response.

If anything goes wrong, the API will respond with a `HTTP 422` error code and an empty response.

#### JSON Sample Request

`DELETE https://learninglogin.com/api/logins/:id`

#### XML Sample Request

`DELETE https://learninglogin.com/api/logins/:id.xml`



