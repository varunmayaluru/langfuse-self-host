# Use the official Langfuse image
FROM langfuse/langfuse:2

# Expose the necessary port
EXPOSE 3000

# Set environment variables
ENV DATABASE_URL=postgresql://neondb_owner:npg_MrVUW0A1kISO@ep-dark-bush-a4rxk4t0-pooler.us-east-1.aws.neon.tech/neondb?sslmode=require
ENV NEXTAUTH_SECRET=mysecret
ENV SALT=mysalt
ENV ENCRYPTION_KEY=b27f90e20407b64df6025e5ad3f3a2ab15b8d617a0f91eda757dcf16f4e04df6
ENV NEXTAUTH_URL=http://localhost:3000
ENV TELEMETRY_ENABLED=${TELEMETRY_ENABLED:-true}
ENV LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES=${LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES:-false}
ENV LANGFUSE_INIT_ORG_ID=${LANGFUSE_INIT_ORG_ID:-}
ENV LANGFUSE_INIT_ORG_NAME=${LANGFUSE_INIT_ORG_NAME:-}
ENV LANGFUSE_INIT_PROJECT_ID=${LANGFUSE_INIT_PROJECT_ID:-}
ENV LANGFUSE_INIT_PROJECT_NAME=${LANGFUSE_INIT_PROJECT_NAME:-}
ENV LANGFUSE_INIT_PROJECT_PUBLIC_KEY=${LANGFUSE_INIT_PROJECT_PUBLIC_KEY:-}
ENV LANGFUSE_INIT_PROJECT_SECRET_KEY=${LANGFUSE_INIT_PROJECT_SECRET_KEY:-}
ENV LANGFUSE_INIT_USER_EMAIL=${LANGFUSE_INIT_USER_EMAIL:-}
ENV LANGFUSE_INIT_USER_NAME=${LANGFUSE_INIT_USER_NAME:-}
ENV LANGFUSE_INIT_USER_PASSWORD=${LANGFUSE_INIT_USER_PASSWORD:-}
ENV PORT=3000
ENV HOST=0.0.0.0

# Change to the web package directory and build Next.js
WORKDIR /app/packages/web

# Ensure dependencies are installed
RUN npm install

# Build the Next.js application
RUN npm run build

# Start the server using the correct path
CMD ["node", "/app/packages/web/.next/standalone/server.js"]
