# Dockerfile

# Use node alpine as it's a small node image
FROM node:16.15.0-alpine3.15 as base-image
# Define stage key/value for build stage
LABEL stage=dependency-install
# ENV NODE_ENV=development

# set a workdir for building the applications
WORKDIR /app

#  copy in nextjs 
# COPY .next ./.next
# copy in just the package.json for caching dependency installs
COPY package*.json ./
RUN npm ci

# Copy the rest of our Next.js folder into /app
# COPY . /app/

# Ensure port 8080 is accessible to our system
EXPOSE 8080

# Run yarn dev, as we would via the command line 
CMD ["npm", "start"]