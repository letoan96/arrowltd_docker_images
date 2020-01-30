# Start from the latest golang base image
FROM golang:1.12.16-alpine

# Add Maintainer Info
LABEL maintainer="Lee Toan <letranthetoan@gmail.com>"

# Set the Current Working Directory inside the container
WORKDIR /go/src/github.com/vic/vic_go
COPY . /go/src
# Copy the source from the current directory to the Working Directory inside the container
# COPY . .
# Copy go mod and sum files
# COPY go.mod go.sum ./
# Download all dependencies. Dependencies will be cached if the go.mod and go.sum files are not changed
# ~/go/src/github.com/p2play/p2play_backend

ENV GOPATH=/go
# Build the Go app
# RUN go get
RUN go get github.com/githubnemo/CompileDaemon
RUN go install

# Expose port 8080 to the outside world
EXPOSE 4007
EXPOSE 4008
# Command to run the executable
# CMD ["p2play_backend"]
ENTRYPOINT CompileDaemon -include="*.tmpl" -build="go install" -command="vic_go"
# ENTRYPOINT vic_go