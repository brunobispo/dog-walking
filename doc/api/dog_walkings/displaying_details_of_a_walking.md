# Dog Walkings API

## Displaying details of a walking

### GET /api/dog_walkings/:id
### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>GET /api/dog_walkings/6</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
ETag: W/&quot;5c96a4bf15c37c37123266bf92224fb0&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e5e6534b-4639-42e4-97b0-10e499512106
X-Runtime: 0.231146
Content-Length: 260</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 6,
  "date": "2019-10-10T23:00:00.000Z",
  "pets": 2,
  "state": "scheduled",
  "duration": null,
  "price": null,
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
