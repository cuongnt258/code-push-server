#!/bin/bash
# Load NVM and set up environment for Yarn
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Pull the latest changes from the repository
git pull

# Install any new dependencies
yarn install

# Build the Next.js application
yarn build

# Start or reload the application with PM2
pm2 startOrRestart ecosystem.config.js --env production

# Save the PM2 process list to start on system reboot
pm2 save

echo "Deployment complete!"