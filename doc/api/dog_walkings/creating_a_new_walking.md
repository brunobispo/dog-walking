# Dog Walkings API

## Creating a new walking

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

<pre>{"dog_walking":{"pets":2,"date":"2019-10-10T23:00:00","address":{"street":"Rua Mario Amaral Barros","number":"100","city":"Limeira","state":"SP"}}}</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
ETag: W/&quot;94490bf82c8707f8ce2c95cf9340f4c0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 5be3744a-408d-4618-a5b5-75a61d9f97e7
X-Runtime: 0.939390
Content-Length: 259</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 1,
  "date": "2019-10-10T23:00:00.000Z",
  "pets": 2,
  "state": "scheduled",
  "duration": null,
  "price": null,
  "address": {
    "street": "Rua Mario Amaral Barros",
    "number": "100",
    "complement": null,
    "city": "Limeira",
    "state": "SP",
    "latitude": "-22.589775",
    "longitude": "-47.401124"
  }
}</pre>
