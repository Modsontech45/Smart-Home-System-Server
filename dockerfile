# Use the official Node.js image as the base image
FROM node;20.17.0-alpine AS builder

# Enable Corepack to manage package managers like Yarn
RUN corepack enable

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and yarn.lock to the working directory
COPY package.json yarn.lock ./

# Copy the rest of the application files
COPY . .

# Install dependencies using Yarn
RUN yarn --immutable

# Expose the port on which your app runs
EXPOSE 3000

# Start the app using Yarn
CMD ["yarn", "start"]
