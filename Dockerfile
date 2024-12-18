# Use an official Node.js runtime as a parent image
FROM node:14-alpine

# Set the working directory
WORKDIR /app

# Copy package.json and package-lock.json to leverage Docker cache
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Set environment variables
ENV PORT=1010

# Expose the port the app runs on
EXPOSE 1010

# Define a health check
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD curl --fail http://localhost:$PORT || exit 1

# Command to run the application
CMD ["npm", "run", "dev"]