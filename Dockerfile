# base image
FROM alpine:3.10


WORKDIR /usr/src/app
# Copy files required for the app to run, see .dockerignore
COPY . /usr/src/app 


RUN apk upgrade --update-cache --available
# Install python and pip
RUN apk add --update --no-cache \
    python3 \
    && pip3 install --no-cache-dir -r /usr/src/app/requirements.txt

# Deploy some bad things... 
# COPY eicar.com /usr/src/app/


# Copy some keys... 
# COPY keyfile /usr/src/app/


# Tell the port number the container should expose
EXPOSE 5000

# Run the application
CMD ["python3", "/usr/src/app/app.py"]
