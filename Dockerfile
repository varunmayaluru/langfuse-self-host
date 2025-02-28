# Use the official Langfuse image
FROM langfuse/langfuse:2

# Expose the informational port (Render will override this at runtime)
EXPOSE 3000

# Copy the entrypoint script and ensure it’s executable
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set environment variables
ENV DATABASE_URL="postgresql://neondb_owner:npg_MrVUW0A1kISO@ep-dark-bush-a4rxk4t0-pooler.us-east-1.aws.neon.tech/neondb?sslmode=require" \
    NEXTAUTH_SECRET="mysecret" \
    SALT="mysalt" \
    ENCRYPTION_KEY="b27f90e20407b64df6025e5ad3f3a2ab15b8d617a0f91eda757dcf16f4e04df6" \
    NEXTAUTH_URL="https://langfuse-self-host.onrender.com" \
    TELEMETRY_ENABLED="true" \
    LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES="false" \
    LANGFUSE_INIT_ORG_ID="" \
    LANGFUSE_INIT_ORG_NAME="" \
    LANGFUSE_INIT_PROJECT_ID="" \
    LANGFUSE_INIT_PROJECT_NAME="" \
    LANGFUSE_INIT_PROJECT_PUBLIC_KEY="" \
    LANGFUSE_INIT_PROJECT_SECRET_KEY="" \
    LANGFUSE_INIT_USER_EMAIL="" \
    LANGFUSE_INIT_USER_NAME="" \
    LANGFUSE_INIT_USER_PASSWORD="" \
    HOST="0.0.0.0"

# Use the entrypoint script, which exports runtime variables
ENTRYPOINT ["/entrypoint.sh"]

# Do not override the CMD. Let the base image's CMD start the server.
