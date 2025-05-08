# Dockerfile

FROM ruby:3.2.2

# Install dependencies
RUN apt-get update && apt-get install -y nodejs postgresql-client yarn

# Set working directory
WORKDIR /app

# Copy Gemfiles and install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of the app
COPY . .

# Expose port (Rails runs on 3000 by default)
EXPOSE 3000

# Default command
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
