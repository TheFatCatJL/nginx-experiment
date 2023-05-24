import requests,os

# REMEMBER WE WERE TALKING ABOUT BEING A CA?
# Here flask will get the CA information from ca-ssl.pem
# What is this like in the real world context? In the real world, we will be like our own closed up env where our servers
# recognise us as the CA, but any one outside when attempting to use their own CA file (which is publicly certified - and chained) in their OS
# Will come to our server and the CA file they have WILL NOT recognise us because we are not a public CA.

# So here we point to the CA cile we created in README- step 2
os.environ["REQUESTS_CA_BUNDLE"] = "certs/ca-ssl.pem"
r = requests.get("https://pyapp.app.io")
print(r.text)
assert r.status_code == 200


