---
title: Inventories
---

## Inventories

The Inventories endpoint is used for assigning courses to users.

## Methods

### Assign Units

To assign units to a user, send a `POST` request to the URL above with the following parameters:

| Name         | Type   | Required? | Description                                                   |
|--------------|--------|-----------|---------------------------------------------------------------|
| course_codes | array  | yes       | List of course codes that will be assigned                    |
| login_ids    | array  | yes       | List of login ids to which selected courses will be assigned  |

#### Sample Request Body

~~~json
  {
    "course_codes": ['JHSC'],
    "login_ids": [1, 2]
  }
~~~

#### Sample Response Body

When courses are successfully assigned, our API will send an empty `JSON` hash as a response: `{ }`
If the assignation requires an extra payment, the response body will include the `extra_payment` key. Example:

~~~json
  {
    "extra_payment": '1'
  }
~~~

If something goes wrong, the API will respond with a `HTTP 422` error code and the error’s description in the response body:

~~~json
  {
    "errors": 'You do not have enough units to complete this operation'
  }
~~~