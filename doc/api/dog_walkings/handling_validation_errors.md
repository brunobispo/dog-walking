# Dog Walkings API

## Handling validation errors

### POST /api/dog_walkings

### Parameters

| Name | Description | Required | Scope |
|------|-------------|----------|-------|
| pets | Number of pets | true | dog_walking |
| date | Date of order | true | dog_walking |
| address_id | Customer address id | false | dog_walking |
| street | Dog walking address street | true | dog_walking[address] |
| number | Dog walking address number | true | dog_walking[address] |
| complement | Dog walking address complement | false | dog_walking[address] |
| city | Dog walking address city | true | dog_walking[address] |
| state | Dog walking address state | true | dog_walking[address] |

### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>POST /api/dog_walkings</pre>

#### Body

<pre>{"dog_walking":{"pets":2,"date":"2019-10-10T23:00:00","address":{"street":"Inexistent st","number":"100","city":"São Paulo","state":"SP"}}}</pre>

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
X-Request-Id: d82afe74-4b3f-423f-85b4-d50d6a0494cb
X-Runtime: 0.972422
Content-Length: 66</pre>

#### Status

<pre>422 Unprocessable Entity</pre>

#### Body

<pre>{
  "message": "Validation failed",
  "errors": {
    "street": [
      "is invalid"
    ]
  }
}</pre>
