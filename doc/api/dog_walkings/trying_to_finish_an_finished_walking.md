# Dog Walkings API

## Trying to finish an finished walking

### PATCH /api/dog_walkings/:id/finish_walk
### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /api/dog_walkings/10/finish_walk</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
Cache-Control: no-cache
X-Request-Id: 627bba7a-0a20-41ce-b56b-725aec132d05
X-Runtime: 0.168172
Content-Length: 43</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{
  "errors": {
    "base": [
      "is already finished"
    ]
  }
}</pre>
