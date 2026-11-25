const express = require('express');
const os = require('os');
const path = require('path');
const pkg = require('./package.json');

const app = express();
const PORT = process.env.PORT || 3000;
const startedAt = new Date();

app.disable('x-powered-by');

// Everything the dashboard shows comes from here.
// Set APP_ENV and APP_VERSION on the container to override the defaults.
function getStatus() {
  return {
    hostname: os.hostname(),
    environment: process.env.APP_ENV || process.env.NODE_ENV || 'development',
    version: process.env.APP_VERSION || pkg.version,
    nodeVersion: process.version,
    startedAt: startedAt.toISOString(),
    uptimeSeconds: Math.floor(process.uptime()),
  };
}

// Health check endpoint (point Azure's health probe at this path)
app.get('/health', (req, res) => {
  res.status(200).json({
    status: 'healthy',
    timestamp: new Date().toISOString(),
    uptimeSeconds: Math.floor(process.uptime()),
  });
});

app.get('/api/status', (req, res) => {
  res.json(getStatus());
});

app.use(express.static(path.join(__dirname, 'public')));

const server = app.listen(PORT, '0.0.0.0', () => {
  console.log(`DevOps Status Dashboard v${getStatus().version} listening on port ${PORT}`);
});

// Let the container stop cleanly when Docker or Azure sends SIGTERM
process.on('SIGTERM', () => {
  console.log('SIGTERM received, shutting down');
  server.close(() => process.exit(0));
});
