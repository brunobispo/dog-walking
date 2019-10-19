# Dog Walkings API

## Trying to start an started walking

### PATCH /api/dog_walkings/:id/start_walk
### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /api/dog_walkings/8/start_walk</pre>

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
X-Request-Id: 515585c6-9386-43ae-92a6-77682bcdc247
X-Runtime: 0.331438
Content-Length: 42</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{
  "errors": {
    "base": [
      "is already started"
    ]
  }
}</pre>
