# Use a Node.js image
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package.json package-lock.json ./

# Install dependencies
RUN npm install

# Copy all other files
COPY . .

# Build the SvelteKit app
RUN npm run build

# Production stage
FROM node:18-alpine AS runner

# Set working directory
WORKDIR /app

# Copy only the built files from the builder
COPY --from=builder /app/build ./build
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules

# Expose the port SvelteKit app will run on
EXPOSE 3000

# Run the SvelteKit app
CMD ["node", "build"]

