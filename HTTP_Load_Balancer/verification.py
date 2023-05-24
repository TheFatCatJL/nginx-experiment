import requests


r = requests.get("http://localhost:8080")
print(r.text)
assert r.status_code == 200


