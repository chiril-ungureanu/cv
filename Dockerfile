FROM ruby:3.1-alpine

# Install build dependencies
RUN apk add --no-cache build-base gcc cmake git

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application
COPY . .

# Expose port 4000
EXPOSE 4000

# Set the default command
CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0"]
