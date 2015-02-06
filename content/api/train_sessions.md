---
title: Train Sessions
---


## Train Sessions


A `TrainSession` represents a training record in the system. Train Sessions track information such as: date of completion, score, date of assignation, percent complete, etc.

The `/api/train_sessions/` endpoint implements RESTful methods to let you interact with your data.


## Methods

### Index

`GET https://learninglogin.com/api/train_sessions`

To retrieve the list of train sessions available for your account, simply send a `GET` request to the URL above. Optionally, you can pass a series of filters for searching purposes.


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


#### Sample Request Body

`GET https://learninglogin.com/api/train_sessions?score=80&completion_date_gteq=2015-01-01`

This request would fetch all training sessions completed from Jan 1st 2015 onwards with a score of "80" percent.


#### Sample Response Body

~~~json
[
  { "id": 3,
    "course_code": "WHMIS",
    "score": 0,
    "percent_complete": 0,
    "failed_attempts": 0,
    "status": "Assigned",
    "cert_expiry": "2016-02-06",
    "completion_date": null,
    "complete_by": null,
    "full_name": "Michelle Dragsta",
    "time_spent": "0.0" },

  { "id": 2,
    "course_code": "TDG",
    "score": 0,
    "percent_complete": 0,
    "failed_attempts": 0,
    "status": "Assigned",
    "cert_expiry": "2016-02-06",
    "completion_date": null,
    "complete_by": null,
    "full_name": "Michelle Dragsta",
    "time_spent": "0.0" },
    
  { "id": 1,
    "course_code": "FP",
    "score": 0,
    "percent_complete": 0,
    "failed_attempts": 0,
    "status": "Assigned",
    "cert_expiry": "2016-02-06",
    "completion_date": null,
    "complete_by": null,
    "full_name": "Michelle Dragsta",
    "time_spent": "0.0" }
]
~~~

### Show

To retrieve a particular train session send a `GET` request to:

`GET https://learninglogin.com/api/train_sessions/:id`

