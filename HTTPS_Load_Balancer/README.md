1. Generate some SSL cert for our custom domain

2. First, go the certs folder (keep it organised)
   ```
   cd certs
   ```

3. We have to be a CA to create ca-signed certificate (1st line of code generates a RSA private key, 2nd line creates & process certificate request)
   ```
   openssl genrsa > ca-ssl.key
   openssl req -new -x509 -key ca-ssl.key > ca-ssl.pem
   ```

- Just press enter for the prompts (for the ca-ssl.pem)

4. Create our own custom domain - in this case pyapp.app.io (1st line of code generates a RSA private key, 2nd line creates a Certificate request - enter the your domain name for Common name)
   ```
   openssl genrsa -out pyapp.app.io.key 2048
   openssl req -new -key pyapp.app.io.key -out pyapp.app.io.csr
   ```

5. Create an ext file using your domain name like pyapp.app.io.ext with the following contents:
   ```
   authorityKeyIdentifier=keyid,issuer
   basicConstraints=CA:FALSE
   keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
   subjectAltName = @alt_names

   [alt_names]
   DNS.1 = pyapp.app.io
   ```

6. We can finally sign our cert
   ```
   openssl x509 -req -in pyapp.app.io.csr -CA ca-ssl.pem -CAkey ca-ssl.key -CAcreateserial -out pyapp.app.io.crt -days 825 -sha256 -extfile pyapp.app.io.ext
   ```

From this process, we will receive two import files
a) pyapp.app.io.crt >> We distrbute this to users who visit our site via https
b) pyapp.app.io.key >> This is not for public distribution. It's meant for our server for SSL configuration (like NGINX for our SSL setup)

7. Different from http setup, we will now require to mount our .crt and .key files from step 6 to our NGINX.
   We can do this via a COPY or we can also do this via volume mounts (which has the advantage of swapping the files as long as our corresponding mount is there)

8. After everything is setup properly, we still need to simulate a "DNS" knows our pyapp.app.io, therefore for testing, we just modifiy our /etc/hosts file by adding the line
   ```
   127.0.0.1 pyapp.app.io
   ```

9. Run
   ```
   docker compose up -d
   ```

10. Run
    ```
    python3 verification.py
    ```
