str = '{
  "errorCode": 0,
  "errorMessage": "",
  "results":
  {
    "http://www.foo.com":
    {
       "hash": "e5TEd",
       "shortKeywordUrl": "",
       "shortUrl": "http://bit.ly/1a0p8G",
       "userHash": "1a0p8G"
    }
  },
  "statusCode": "OK"
}'


require 'json'
hash = JSON.parse str
puts hash
