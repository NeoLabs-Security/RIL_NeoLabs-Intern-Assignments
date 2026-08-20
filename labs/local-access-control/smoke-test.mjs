const base = process.env.LAB_URL || 'http://127.0.0.1:8088';

async function expectJson(path, expectedStatus, headers = {}) {
  const response = await fetch(base + path, { headers });
  const body = await response.json();
  if (response.status !== expectedStatus) {
    throw new Error(`${path}: expected HTTP ${expectedStatus}, received ${response.status}`);
  }
  return body;
}

try {
  const health = await expectJson('/health', 200);
  if (health.synthetic !== true) throw new Error('Health response is not marked synthetic.');

  const mine = await expectJson('/api/my-orders', 200, { 'x-demo-user': 'learner-01' });
  if (!Array.isArray(mine.orders) || mine.orders.length !== 1 || mine.orders[0].id !== 'order-101') {
    throw new Error('Normal ownership workflow returned unexpected data.');
  }

  const controlled = await expectJson('/api/orders/order-102', 200, { 'x-demo-user': 'learner-01' });
  if (controlled.order?.owner_id !== 'learner-02') {
    throw new Error('The intended synthetic training condition is not present.');
  }

  console.log('PASS: local access-control lab is healthy, interactive and ready for the documented exercise.');
} catch (error) {
  console.error('FAIL:', error instanceof Error ? error.message : String(error));
  console.error('Check: docker compose ps, http://127.0.0.1:8088/health, browser JavaScript, and port 8088 conflicts.');
  process.exitCode = 1;
}
