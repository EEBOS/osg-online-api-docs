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

#### Sample JSON Response Body: Success

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

#### Sample XML Response Body: Success

~~~xml
  <?xml version="1.0" encoding="UTF-8"?>
  <courses type="array">
     <course>
        <id type="integer">2</id>
        <name>Transport</name>
        <code>TCD</code>
        <language>English</language>
     </course>
     <course>
        <id type="integer">1</id>
        <name>WHM</name>
        <code>WH1</code>
        <language>French</language>
     </course>
  </courses>
~~~
