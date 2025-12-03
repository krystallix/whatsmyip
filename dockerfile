# Build stage
FROM golang:1.22-alpine AS build

WORKDIR /app
COPY . .

RUN go build -o identme main.go

# Final stage
FROM alpine:3.19

WORKDIR /app
COPY --from=build /app/whatsmyip .

EXPOSE 8080

CMD ["./whatsmyip"]