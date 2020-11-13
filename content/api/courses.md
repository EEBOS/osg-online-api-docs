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
Results are paginated following the [RFC-8288](https://tools.ietf.org/html/rfc8288) standard for web linking; links are provided
in the response headers so they can be navigated programmaticaly.

#### Pagination response headers

| Link &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	          |  `<https://learninglogin.com/api/courses.json?page=1>;` `rel="first"`, <br/> `<https://learninglogin.com/api/courses.json?page=1>;` `rel="prev"`, <br/>`<https://learninglogin.com/api/courses.json?page=4>;` `rel="last"`, <br/>`<https://learninglogin.com/api/courses.json?page=3>;` `rel="next"` |
| Per-Page	      |  64                                    |
| Total 	      |  195                                  |

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
