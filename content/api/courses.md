---
title: Courses
---

## Courses

The `/api/courses` endpoint a couple of methods to let you retrieve information about the existing courses and assign units to your users.

### List

To retrieve the list of courses, send a `GET` request to the base courses' endpoint, no extra parameters are required.

`GET https://learninglogin.com/api/courses`

#### Sample response body

```
  [
    {
      "id": 1,
      "name": "Aerial Lift",
      "code": "AL",
      "language": "English"
    },
    {
      "id": 2,
      "name": "AODA",
      "code": "AODA",
      "language": French
    }
  ]
```

### Assign Units

To create a new user, send a `POST` request to the base users' endpoint with the following parameters:

| Name        | Type   | Required? | Description                                              |
|-------------|--------|-----------|----------------------------------------------------------|
| ids         | array  | yes       | List of course ids that will be assigned                 |
| login_ids   | array  | yes       | List of login ids to which the courses will be assigned  |

#### Sample request body

An example request body to assign the course with `id` 2 to users with `id` 1 and 2 will be:

```
  {
    ids: [2],
    login_ids: [1, 2]
  }
```

#### Sample response body

When the courses are successfully assigned, our API will send an empty `JSON` response `{ }`; just in case the action requires an extra payment, the response body will include the key `extra_payment` as follows:

```
  {
    "extra_payment": '1'
  }
```

If something goes wrong, the API will respond with a `422` error code and the error's description in `JSON` format:

```
  {
    "errors": "You do not have enough units to complete this operation"
  }
```
