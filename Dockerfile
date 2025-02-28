# Use the official Langfuse image
FROM langfuse/langfuse:2

# Create a non-root user and group
RUN addgroup -S appgroup && adduser -S appuser -G appgroup

# Set the working directory
WORKDIR /app/packages/web

# Copy package.json and package-lock.json with correct ownership
COPY --chown=appuser:appgroup package*.json ./

# Switch to the non-root user
USER appuser

# Install dependencies
RUN npm install

# Copy the rest of the application code with correct ownership
COPY --chown=appuser:appgroup . .

# Build the Next.js application
RUN npm run build

# Expose the necessary port
EXPOSE 3000

# Set environment variables
ENV DATABASE_URL=postgresql://neondb_owner:password@host/neondb?sslmode=require
ENV NEXTAUTH_SECRET=mysecret
ENV SALT=mysalt
ENV ENCRYPTION_KEY=your_encryption_key
ENV NEXTAUTH_URL=http://localhost:3000
ENV TELEMETRY_ENABLED=true
ENV LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES=false
ENV LANGFUSE_INIT_ORG_ID=
ENV LANGFUSE_INIT_ORG_NAME=
ENV LANGFUSE_INIT_PROJECT_ID=
ENV LANGFUSE_INIT_PROJECT_NAME=
ENV LANGFUSE_INIT_PROJECT_PUBLIC_KEY=
ENV LANGFUSE_INIT_PROJECT_SECRET_KEY=
ENV LANGFUSE_INIT_USER_EMAIL=
ENV LANGFUSE_INIT_USER_NAME=
ENV LANGFUSE_INIT_USER_PASSWORD=
ENV PORT=3000
ENV HOST=0.0.0.0

# Start the application
CMD ["node", ".next/standalone/server.js"]
