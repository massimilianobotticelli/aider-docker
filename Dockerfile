# Use the official aider image which comes with all optional extras
FROM paulgauthier/aider-full:latest

# Create a non-root user and group
RUN groupadd -r appgroup && useradd -r -g appgroup -s /bin/bash appuser

# Set the working directory
WORKDIR /app

# Change ownership of the working directory
RUN chown -R appuser:appgroup /app

# Switch to the non-root user
USER appuser

# Set the entrypoint to be aider
ENTRYPOINT ["aider"]
