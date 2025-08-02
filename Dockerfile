# Use the official aider image which comes with all optional extras
FROM paulgauthier/aider-full:latest

# Set the working directory
WORKDIR /app

# Set the entrypoint to be aider
ENTRYPOINT ["aider"]
