---
title: Courses
---

## Courses

You can retrieve information about courses for assignation through this endpoint.

NOTE: Courses are assigned to users through the `Inventories` endpoint, not the courses endpoint.

## Methods

### Index

`https://learninglogin.com/api/courses`

To retrieve the list of courses, send a `GET` request to the URL above, no extra parameters are required.

#### JSON Sample Request

`GET https://learninglogin.com/api/courses`

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

#### XML Sample Request

`GET https://learninglogin.com/api/courses.xml`

#### Sample XML Response Body: Success

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<courses type="array">
   <course>
      <id type="integer">1</id>
      <name>Aerial Lift</name>
      <code>AL</code>
      <language>English</language>
   </course>
   <course>
      <id type="integer">2</id>
      <name>AODA</name>
      <code>AODA</code>
      <language>French</language>
   </course>
</courses>
~~~
