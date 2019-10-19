# Dog Walkings API

## Finish a walking

### PATCH /api/dog_walkings/:id/finish_walk
### Request

#### Headers

<pre>Accept: application/json
Content-Type: application/json
Host: example.org
Cookie: </pre>

#### Route

<pre>PATCH /api/dog_walkings/9/finish_walk</pre>

### Response

#### Headers

<pre>X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Content-Type: application/json; charset=utf-8
ETag: W/&quot;3491a7a7dcdc4803d4508d24c818d8ea&quot;
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: 68e0a54b-5b55-4526-a594-d44b4d8abf07
X-Runtime: 0.357925
Content-Length: 259</pre>

#### Status

<pre>200 OK</pre>

#### Body

<pre>{
  "id": 9,
  "date": "2019-10-10T23:00:00.000Z",
  "pets": 2,
  "state": "finished",
  "duration": 2999,
  "price": 55.0,
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
