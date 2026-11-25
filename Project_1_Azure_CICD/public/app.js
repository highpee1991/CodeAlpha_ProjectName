const $ = (id) => document.getElementById(id);

function greet() {
  const h = new Date().getHours();
  const part = h < 12 ? 'Good morning' : h < 18 ? 'Good afternoon' : 'Good evening';
  $('greeting').textContent = `${part}. Here is what is running right now.`;
}

function formatUptime(totalSeconds) {
  const d = Math.floor(totalSeconds / 86400);
  const h = Math.floor((totalSeconds % 86400) / 3600);
  const m = Math.floor((totalSeconds % 3600) / 60);
  const s = totalSeconds % 60;
  if (d) return `${d}d ${h}h ${m}m`;
  if (h) return `${h}h ${m}m ${s}s`;
  if (m) return `${m}m ${s}s`;
  return `${s}s`;
}

async function loadStatus() {
  try {
    const res = await fetch('/api/status', { cache: 'no-store' });
    const data = await res.json();
    const env = String(data.environment).toLowerCase();

    document.documentElement.dataset.env = env;
    document.title = `v${data.version} · ${env} · DevOps Status`;
    $('version').textContent = `v${data.version}`;
    $('environment').textContent = env.charAt(0).toUpperCase() + env.slice(1);
    $('hostname').textContent = data.hostname;
    $('uptime').textContent = formatUptime(data.uptimeSeconds);
    $('node').textContent = data.nodeVersion;
  } catch (err) {
    $('environment').textContent = 'Could not load status';
    $('hostname').textContent = 'Could not load status';
  }
}

async function checkHealth() {
  const started = performance.now();
  try {
    const res = await fetch('/health', { cache: 'no-store' });
    const data = await res.json();
    const ms = Math.round(performance.now() - started);
    const ok = res.ok && data.status === 'healthy';
    $('dot').className = `dot ${ok ? 'ok' : 'bad'}`;
    $('health').textContent = ok ? 'Healthy' : 'Unhealthy';
    $('latency').textContent = `${ms} ms`;
    if (ok) $('uptime').textContent = formatUptime(data.uptimeSeconds);
  } catch (err) {
    $('dot').className = 'dot bad';
    $('health').textContent = 'Unreachable';
    $('latency').textContent = '';
  }
}

greet();
loadStatus();
checkHealth();
setInterval(checkHealth, 5000);
