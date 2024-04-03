# Use the Metabase image as the base image
FROM metabase/metabase:latest

# Set Metabase to use SQLite
ENV MB_DB_TYPE=sqlite
ENV MB_DB_FILE=/metabase-data/metabase.db

# Create a directory for the SQLite database file
RUN mkdir -p /metabase-data

# Make the directory writable by Metabase user
RUN chown -R metabase:metabase /metabase-data

# Expose the default Metabase port
EXPOSE 3000

# Start Metabase
CMD ["java", "-jar", "/app/metabase.jar"]
