---
title: Courses
---

## Courses

The `/api/courses` endpoint a couple of methods to let you retrieve information about the existing courses and assign units to your users.

### List

To retrieve the list of courses, send a `GET` request to the base courses' endpoint, no extra parameters are required.

`GET https://learninglogin.com/api/courses`

#### Sample response body

~~~json
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
~~~
