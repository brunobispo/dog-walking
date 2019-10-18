# Dog Walkings API

## Listing walkings

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
ETag: W/&quot;84b8f7b924a03b614d86fb2a322231f1&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 303d16f7-f095-4af4-bb6f-e530d7c508e1
X-Runtime: 0.114236
Content-Length: 144</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "dog_walkings": [
    {
      "id": 2,
      "date": "2019-10-10T10:10:10.000Z",
      "state": "scheduled"
    },
    {
      "id": 3,
      "date": "2019-10-10T10:10:10.000Z",
      "state": "scheduled"
    }
  ]
}</pre>
