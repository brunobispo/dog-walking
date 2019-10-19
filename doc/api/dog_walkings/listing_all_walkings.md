# Dog Walkings API

## Listing all walkings

### GET /api/dog_walkings

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| upcoming | Filter upcoming walkings | false |  |

### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /api/dog_walkings</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
ETag: W/&quot;7ae327ef71e6ededaf41f6791e902e07&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 25612576-0b0f-47b0-af38-a7ffa040b56b
X-Runtime: 0.162926
Content-Length: 144</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "dog_walkings": [
    {
      "id": 5,
      "date": "2019-10-09T10:10:10.000Z",
      "state": "scheduled"
    },
    {
      "id": 4,
      "date": "2019-10-10T10:10:10.000Z",
      "state": "scheduled"
    }
  ]
}</pre>
