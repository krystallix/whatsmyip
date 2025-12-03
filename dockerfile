# Build stage
FROM golang:1.21-alpine AS build

WORKDIR /app
COPY . .

RUN go build -o whatsmyip main.go

# Final stage
FROM alpine:3.19

WORKDIR /app
COPY --from=build /app/whatsmyip .

EXPOSE 9977

CMD ["./whatsmyip"]