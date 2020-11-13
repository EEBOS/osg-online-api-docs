---
title: Train Sessions
---


## Train Sessions

A `TrainSession` represents a training record in the system. Train Sessions track information such as: date of completion, score, date of assignation, percent complete, etc.

The `/api/train_sessions/` endpoint implements RESTful methods to let you interact with your data.

## Methods

### Index

`https://learninglogin.com/api/train_sessions`

To retrieve the list of train sessions available for your account, simply send a `GET` request to the URL above. Optionally, you can pass a series of filters for searching purposes.
Results are paginated following the [RFC-8288](https://tools.ietf.org/html/rfc8288) standard for web linking; links are provided
in the response headers so they can be navigated programmaticaly.

#### Pagination response headers

| Link &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	          |  `<https://learninglogin.com/api/train_sessions.json?page=1>;` `rel="first"`, <br/> `<https://learninglogin.com/api/train_sessions.json?page=1>;` `rel="prev"`, <br/>`<https://learninglogin.com/api/train_sessions.json?page=24>;` `rel="last"`, <br/>`<https://learninglogin.com/api/train_sessions.json?page=3>;` `rel="next"` |
| Per-Page	      |  64                                    |
| Total 	      |  1535                                  |


#### Available search filters

All of these parameters should be sent in as GET parameters.

All date parameters should be sent in a `YYYY-MM-DD` format.

| Name                             | Type   | Description                                                           |
|----------------------------------|--------|-----------------------------------------------------------------------|
| course_code_or_course_name_cont  | string | Filter by course code or course name.                                  |
| full_name_cont                   | string | Filter by full name.                                                   |
| score_eq                         | string | Filter by score.                                                       |
| completion_date_gteq             | string | Filter by completion date greater or equal to the date provided.       |
| completion_date_lteq             | string | Filter by completion date less than or equal to the date provided.     |
| cert_expiry_gt                   | string | Filter by certificate expiry greater or equal to the date provided.    |
| cert_expiry_lt                   | string | Filter by certificate expiry less than or equal to the date provided.  |
| percent_complete_eq              | string | Filter by % complete.                                                  |
| complete_by_eq                   | string | Filter by date of completion.                                          |
| last_attempt_eq                  | string | Filter by date of last attempt.                                        |
| assignee_login_username_eq       | string | Filter by the assigned trainee's username.                             |
| failed_attempts_eq               | string | Filter by # of failed attempts at the Final Quiz.                      |

#### JSON Sample Request

`GET https://learninglogin.com/api/train_sessions?score_eq=80&completion_date_gteq=2015-01-01`

The above request would fetch all training sessions completed from Jan 1st 2015 onwards with a score of "80" percent.

####  JSON Sample Response Body

~~~json
[
  { "id": 3,
    "course_code": "WHMIS",
    "score": 80,
    "percent_complete": 0,
    "failed_attempts": 0,
    "status": "Completed",
    "cert_expiry": "2016-02-06",
    "completion_date": "2015-01-01",
    "complete_by": null,
    "full_name": "Michelle Dragsta",
    "time_spent": "0.0" },

  { "id": 2,
    "course_code": "TDG",
    "score": 80,
    "percent_complete": 100,
    "failed_attempts": 0,
    "status": "Completed",
    "cert_expiry": "2016-02-06",
    "completion_date": "2015-01-02",
    "complete_by": null,
    "full_name": "Michelle Dragstra",
    "time_spent": "0.0" },

  { "id": 1,
    "course_code": "FP",
    "score": 80,
    "percent_complete": 100,
    "failed_attempts": 0,
    "status": "Completed",
    "cert_expiry": "2016-02-06",
    "completion_date": "2015-01-03",
    "complete_by": null,
    "full_name": "Michelle Dragstra",
    "time_spent": "0.0" }
]
~~~

#### XML Sample Request

`GET https://learninglogin.com/api/train_sessions.xml?score_eq=80&completion_date_gteq=2015-01-01`

#### XML Sample Response Body

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<train-sessions type="array">
   <train-session>
      <id type="integer">3</id>
      <course-code>WHMIS</course-code>
      <score type="integer">80</score>
      <percent-complete type="integer">100</percent-complete>
      <failed-attempts type="integer">0</failed-attempts>
      <status>Completed</status>
      <cert-expiry type="date">2016-02-06</cert-expiry>
      <completion-date>2015-01-01</completion-date>
      <complete-by nil="true" />
      <full-name>Michelle Dragstra</full-name>
      <time-spent type="decimal">0.0</time-spent>
   </train-session>
   <train-session>
      <id type="integer">2</id>
      <course-code>TDG</course-code>
      <score type="integer">80</score>
      <percent-complete type="integer">100</percent-complete>
      <failed-attempts type="integer">0</failed-attempts>
      <status>Completed</status>
      <cert-expiry type="date">2016-08-04</cert-expiry>
      <completion-date>2015-01-02</completion-date>
      <complete-by nil="true" />
      <full-name>Michelle Dragstra</full-name>
      <time-spent type="decimal">0.0</time-spent>
   </train-session>
   <train-session>
      <id type="integer">1</id>
      <score type="integer">80</score>
      <course-code>FP</course-code>
      <percent-complete type="integer">100</percent-complete>
      <failed-attempts type="integer">0</failed-attempts>
      <status>Completed</status>
      <cert-expiry type="date">2016-08-04</cert-expiry>
      <completion-date>2015-01-03</completion-date>
      <complete-by nil="true" />
      <full-name>Michelle Dragstra</full-name>
      <time-spent type="decimal">0.0</time-spent>
   </train-session>
</train-sessions>
~~~

### Show

`https://learninglogin.com/api/train_sessions/:id`

To retrieve a particular train session send a `GET` request to:

#### JSON Sample Request

`GET https://learninglogin.com/api/train_sessions/:id`

#### JSON Sample Response

~~~json
{
  "id": 1,
  "score": 0,
  "percent_complete": 0,
  "failed_attempts": 0,
  "status": 'Assigned',
  "cert_expiry": '2016-08-21',
  "completion_date": nil,
  "complete_by": nil,
  "full_name": 'Michelle Dragsta',
  "time_spent": 0,
  "course_code": 'WHMIS',
  "success": nil
}
~~~

#### XML Sample Request

`GET https://learninglogin.com/api/train_sessions/:id.xml`

#### XML Sample Response Body

~~~xml
<?xml version="1.0" encoding="UTF-8"?>
<train-session>
   <id type="integer">1</id>
   <score type="integer">0</score>
   <percent-complete type="integer">0</percent-complete>
   <failed-attempts type="integer">0</failed-attempts>
   <status>Assigned</status>
   <cert-expiry type="date">2016-08-04</cert-expiry>
   <completion-date nil="true" />
   <complete-by nil="true" />
   <full-name>Michelle Dragstra</full-name>
   <time-spent type="decimal">0.0</time-spent>
   <course-code>WMIS</course-code>
   <success nil="true" />
</train-session>
~~~

### Unassign

`https://learninglogin.com/api/train_sessions/unassign`

To remove one or more train sessions, send a `POST` request to the url above with the following parameters:

| Name         | Type   | Required? | Description                                                   |
|--------------|--------|-----------|---------------------------------------------------------------|
| course_codes | array  | yes       | List of course codes that will be assigned                    |
| login_id     | integer  | yes     | ID of user whose courses will be removed.                     |

The unassign endpoint allows you to unassign multiple courses for a single user. There is currently no way to unassign multiple courses for multiple users in a single call.

####  JSON Sample Request Body

`POST https://learninglogin.com/api/train_sessions/unassign`

~~~json
  {
    "course_codes": ['JHSC'],
    "login_id": 1
  }
~~~

#### XML Sample Request Body

`POST https://learninglogin.com/api/train_sessions/unassign.xml`

Note: Remember to add `type='array'` to `<course-codes>` tag and all parameters should be sent inside a tag `<content>`

~~~xml
<?xml version='1.0' encoding='UTF-8'?>
<content>
  <course-codes type='array'>
    <course-code>JHSC</course-code>
  </course-codes>
  <login-id type='integer'>1</login-id>
</content>
~~~

#### Sample Response Body: Success

When one or more `train_sessions` are successfully destroyed, our API will send an `HTTP 200` response with an empty body.

#### Sample Response Body: Failure
If *none* of the specified courses are found for the login sent, the API will respond with an `HTTP 200` response with the following message:

~~~
Could not find any corresponding train sessions.
~~~

### Course Player

To actually consume a train session through the course player, visit the url:

`http://learninglogin.com/api/train_sessions/:login_id/:course_code?token=:token`

| Name        | Type    | Required? | Description                                                                       |
|-------------|---------|-----------|-----------------------------------------------------------------------------------|
| login_id    | integer | yes       | Id of login consuming the train session                                           |
| course_code | string  | yes       | Unique code which identifies the course, i.e. WHMIS                               |
| token       | string  | yes       | Authentication token. If wrong, you will receive a 'Authentication error' message |

If you want to embed the course player into your site, just insert an `iframe` with the url above in the `src` property:

~~~html
<iframe src="http://learninglogin.com/api/train_sessions/1/WHMIS?token=TOKENHERE"> </iframe>
~~~
