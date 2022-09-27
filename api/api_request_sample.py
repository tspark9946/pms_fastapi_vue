import base64
import hmac
from datetime import datetime, timedelta

import requests


def parse_params_to_str(params):
  url = "?"
  for key, value in params.items():
    url = url + str(key) + '=' + str(value) + '&'
  return url[1:-1]


def hash_string(qs, secret_key):
  mac = hmac.new(bytes(secret_key, encoding='utf8'), bytes(qs, encoding='utf-8'), digestmod='sha256')
  d = mac.digest()
  validating_secret = str(base64.b64encode(d).decode('utf-8'))
  return validating_secret


def sample_request():
  access_key = "61cd447b-9ce2-41ae-8c89-122a7fa4-85cd-410a-a4f6-8cfce0ffb786"
  secret_key = "bPeDKPOfdTGFZ244s6sSbuqkeljbmsFum7FOj0sZ"
  cur_time = datetime.utcnow()+timedelta(hours=9)
  cur_timestamp = int(cur_time.timestamp())
  qs = dict(key=access_key, timestamp=cur_timestamp)
  header_secret = hash_string(parse_params_to_str(qs), secret_key)

  url = f"http://127.0.0.1:8000/api/services?{parse_params_to_str(qs)}"
  res = requests.get(url, headers=dict(secret=header_secret))
  return res


print(sample_request().json())

if __name__ == '__main__':
  sample_request()