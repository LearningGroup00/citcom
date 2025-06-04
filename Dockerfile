# Dockerfile

FROM ruby:3.2.2-slim

# Set environment variables to avoid prompts
ENV DEBIAN_FRONTEND=noninteractive

# Install essential build tools and dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  curl \
  git \
  ca-certificates \
  gnupg \
  && rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock before the rest of the code to leverage Docker cache
COPY Gemfile Gemfile.lock ./

# Install gems
RUN gem update --system && \
    bundle config set --local path 'vendor/bundle' && \
    bundle install

# Copy the full app code
COPY . .

# Generate binstubs (for bin/rails etc.)
RUN bundle exec rails app:update:bin

# Compile assets (handle both sprockets and shakapacker)
RUN bin/rails assets:precompile || echo "Asset precompilation failed — ignoring for build"
RUN bin/rails shakapacker:compile || echo "Shakapacker compile failed — ignoring for build"

# Expose port 3000
EXPOSE 3000

# Start Rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
