---
title: Courses
---

## Courses

You can retrieve information about courses for assignation through this endpoint.

NOTE: Courses are assigned to users through the `Inventories` endpoint, not the courses endpoint.

## Methods

### Index

`GET https://learninglogin.com/api/courses`

To retrieve the list of courses, send a `GET` request to the URL above, no extra parameters are required.

#### Sample Response Body: Success

~~~json
  [
    {
      "id": 1,
      "name": 'Aerial Lift',
      "code": 'AL',
      "language": 'English'
    },
    {
      "id": 2,
      "name": 'AODA',
      "code": 'AODA',
      "language": French
    }
  ]
~~~
