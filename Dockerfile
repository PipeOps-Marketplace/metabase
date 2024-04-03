# Use the Metabase image as the base image
FROM metabase/metabase:latest

# Set Metabase to use SQLite
ENV MB_DB_TYPE=sqlite
ENV MB_DB_FILE=/metabase-data/metabase.db

USER root

# Create a directory for the SQLite database file
RUN mkdir -p /metabase-data

# Change ownership of the /metabase-data directory to metabase user/group
RUN chown -R root:root /metabase-data

# Expose the default Metabase port
EXPOSE 3000

# Start Metabase
CMD ["java", "-jar", "/app/metabase.jar"]
