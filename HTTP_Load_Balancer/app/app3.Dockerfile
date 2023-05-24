FROM python:3.10.7-slim-buster

WORKDIR /usr/src/app

# PYTHONDONTWRITEBYTECODE 1 = Python won’t try to write .pyc files on the import of source modules
# .pyc created when first imported/executed by Python interpretator
# .pyc is version specific
# .pyc = faster script execution times, especially for large scripts or modules
ENV PYTHONDONTWRITEBYTECODE 1
# PYTHONUNBUFFERED 1 = Force the stdout and stderr streams to be unbuffered. This option has no effect on the stdin stream.
# When interactive, the stdout stream is line-buffered. Otherwise, it is block-buffered like regular text files. 
# The stderr stream is line-buffered in both cases. Unbuffer for ASAP print
ENV PYTHONUNBUFFERED 1

# Get pip to upgrade and install flask
RUN pip install --upgrade pip
RUN pip install flask

# Copy app1.py to /usr/src/app
# location of current Dockerfile (this file) is the relative path
COPY app3.py /usr/src/app/app.py
