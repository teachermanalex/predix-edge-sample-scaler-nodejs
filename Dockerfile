# start with the Predix Edge base alpine image
#FROM dtr.predix.io/predix-edge/alpine-amd64
FROM alpine:3.9


#install nodejs into the base image
RUN apk update && apk add nodejs

# Create app directory in the image
WORKDIR /usr/src

# copy app's source files to the image
COPY src/package*.json ./
COPY src/index.js ./

# pull all required node packages into the app
RUN npm install

# start the app
CMD [ "node", "index.js" ]
