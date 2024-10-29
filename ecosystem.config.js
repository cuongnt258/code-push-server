module.exports = {
  apps: [
    {
      name: "code-push-server",
			script: "yarn",
      args: "start",
      autorestart: false,
      watch: false,
      max_memory_restart: "1G",
    },
  ],
};
