# Getting Started

## Requirements

* Ruby 2.6.5
* Postgres

## Running the application

* Clone the repo.
* From the repository's directory, run the following commands:

`$ bundle install`
`$ rake db:setup`
`$ rails server`

The application will launch and will be available at `http://localhost:3000`

## Creating a short URL

Payload:

```
{
  "long_url": "https://alongurl.com"
}
```

Endpoint:

`POST http://localhost:3000/short_links`

Response:

```
{
  "data":
  {
    "id": "83",
    "type": "short_links",
    "attributes":
    {
      "long_url": "https://alongurl.com",
      "short_link": "http://localhost:3000/fa2cbd47c073",
      "created_at": "2019-10-07T22:11:07.986Z",
      "updated_at": "2019-10-07T22:11:07.986Z"
    }
  }
}
```

## Visiting a short URL

Endpoint:

`GET http://localhost:3000/fa2cbd47c073`

Response: A 302 redirect to the full URL.

## Running the tests

From the application's directory:

`$ rspec`