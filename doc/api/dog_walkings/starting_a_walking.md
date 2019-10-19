# Dog Walkings API

## Starting a walking

### PATCH /api/dog_walkings/:id/start_walk
### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /api/dog_walkings/7/start_walk</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3636eb6948d6814c444bc26bd8715c02&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 2348f0ab-736d-4ee9-be26-be20eee34f8f
X-Runtime: 0.336686
Content-Length: 255</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 7,
  "date": "2019-10-10T23:00:00.000Z",
  "pets": 2,
  "state": "started",
  "duration": 0,
  "price": 40.0,
  "address": {
    "street": "Rua Mário Amaral Barros",
    "number": "100",
    "complement": null,
    "city": "Limeira",
    "state": "SP",
    "latitude": "-22.589775",
    "longitude": "-47.401124"
  }
}</pre>
