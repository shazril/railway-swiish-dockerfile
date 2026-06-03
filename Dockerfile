FROM crin/swiish:latest

# Create a temporary home to preserve the built source code
RUN mkdir -p /app-backup && \
    cp -a /app/. /app-backup/

# Copy the wrapper script into the container root
COPY entrypoint.sh /entrypoint.sh

# Give the script executable permissions
RUN chmod +x /entrypoint.sh

# Change the default startup sequence to evaluate your entrypoint first
ENTRYPOINT ["/entrypoint.sh"]