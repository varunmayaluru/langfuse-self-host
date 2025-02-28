#!/bin/sh
# Export a custom variable based on the runtime $PORT
export MY_CUSTOM_PORT="$PORT"
# Optionally print the variable for debugging
echo "MY_CUSTOM_PORT is set to $MY_CUSTOM_PORT"

# Execute the container’s CMD
exec "$@"
