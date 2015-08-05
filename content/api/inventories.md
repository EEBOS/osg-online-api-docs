---
title: Inventories
---

## Inventories

The Inventories endpoint is used for assigning courses to users.

## Methods

### Assign Units

`POST https://learninglogin.com/api/inventories/assign_units`

To assign units to a user, send a `POST` request to the URL above with the following parameters:

| Name         | Type   | Required? | Description                                                   |
|--------------|--------|-----------|---------------------------------------------------------------|
| course_codes | array  | yes       | List of course codes that will be assigned                    |
| login_ids    | array  | yes       | List of login ids to which selected courses will be assigned  |

#### Sample JSON Request Body

~~~json
  {
    "course_codes": ['JHSC'],
    "login_ids": [1, 2]
  }
~~~

Note: It is important to mantain the "type" of the parameter in the tag for the arrays of course_codes and login-ids

~~~xml
  <?xml version="1.0" encoding="UTF-8"?>
  <course-codes type="array">
     <course-code>WH1</course-code>
     <course-code>WH2</course-code>
  </course-codes>
  <login-ids type="array">
     <login-id type="integer">1</login-id>
  </login-ids>
~~~


#### Sample JSON Response Body

When courses are successfully assigned, our API will send an empty `JSON` hash as a response: `{ }`
If the assignation requires an extra payment, the response body will include the `extra_payment` key. Example:

~~~json
  {
    "extra_payment": '1'
  }
~~~

#### Sample XML Response Body

~~~xml
  <?xml version="1.0" encoding="UTF-8"?>
  <content>
     <extra-payment>1</extra-payment>
  </content>
~~~


If something goes wrong, the API will respond with a `HTTP 422` error code and the error’s description in the response body:

~~~json
  {
    "errors": 'You do not have enough units to complete this operation'
  }
~~~

~~~xml
  <?xml version="1.0" encoding="UTF-8"?>
  <errors>
     <error>No courses found for given codes</error>
  </errors>
~~~
