# Dog Walkings API

## Listing upcoming walkings

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

<pre>GET /api/dog_walkings?upcoming=true</pre>

#### Query Parameters

<pre>upcoming: true</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
ETag: W/&quot;73c4c2dd2341776e2d5fc0452457971d&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: a58f8743-f4d6-4a2b-ae0b-1a15a6b068d0
X-Runtime: 0.223105
Content-Length: 81</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "dog_walkings": [
    {
      "id": 2,
      "date": "2019-10-10T10:10:10.000Z",
      "state": "scheduled"
    }
  ]
}</pre>
