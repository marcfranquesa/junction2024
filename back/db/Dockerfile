# Start with a lightweight Alpine image
FROM alpine:latest

# Install SQLite
RUN apk update && apk add sqlite && rm -rf /var/cache/apk/*

# Set the working directory
WORKDIR /app

# Copy schema.sql to initialize the database
COPY schema.sql .

# Initialize the database with the schema
RUN sqlite3 /app/database.db < schema.sql

# Set the default command to run SQLite interactively
CMD ["sqlite3", "/app/database.db"]

