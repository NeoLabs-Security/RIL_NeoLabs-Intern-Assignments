import http from 'node:http';
import { URL } from 'node:url';

const port = 3000;

const users = {
  'learner-01': { id: 'learner-01', name: 'Amara Okoye', role: 'learner' },
  'learner-02': { id: 'learner-02', name: 'Tobi Ekanem', role: 'learner' }
};

const orders = {
  'order-101': { id: 'order-101', owner_id: 'learner-01', item: 'Synthetic lab notebook', status: 'ready' },
  'order-102': { id: 'order-102', owner_id: 'learner-02', item: 'Synthetic USB adapter', status: 'processing' }
};

function sendJson(response, statusCode, body) {
  response.writeHead(statusCode, {
    'content-type': 'application/json; charset=utf-8',
    'cache-control': 'no-store',
    'x-content-type-options': 'nosniff'
  });
  response.end(JSON.stringify(body, null, 2));
}

function selectedUser(request) {
  const raw = request.headers['x-demo-user'];
  return typeof raw === 'string' && users[raw] ? users[raw] : null;
}

const page = `<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width,initial-scale=1">
  <title>NeoLabs Local Access-Control Lab</title>
  <style>
    body{font-family:system-ui,sans-serif;max-width:820px;margin:40px auto;padding:0 20px;line-height:1.5;background:#f8fafc;color:#0f172a}
    button,select,input{font:inherit;padding:9px;margin:4px;border-radius:6px;border:1px solid #94a3b8}
    button{cursor:pointer;background:#0f766e;color:white;border-color:#0f766e}
    button:hover{filter:brightness(.95)}
    pre{background:#111827;color:#e5e7eb;padding:16px;border-radius:8px;overflow:auto;min-height:130px}
    .note{background:#eef6ff;border-left:4px solid #0f766e;padding:12px}
    .status{font-size:.9rem;color:#475569;margin-top:10px}
  </style>
</head>
<body>
  <h1>NeoLabs Local Access-Control Lab</h1>
  <p class="note">Synthetic localhost training only. The proof threshold is one read-only observation.</p>
  <label>Synthetic user
    <select id="user">
      <option value="learner-01">learner-01 — Amara</option>
      <option value="learner-02">learner-02 — Tobi</option>
    </select>
  </label>
  <div>
    <button id="mine" type="button">My orders</button>
    <input id="order" value="order-101" aria-label="Order identifier">
    <button id="one" type="button">Get order by ID</button>
  </div>
  <div id="status" class="status">Ready. Start with “My orders”.</div>
  <pre id="output">Use the normal workflow first.</pre>
  <script>
    const output = document.getElementById('output');
    const status = document.getElementById('status');
    const user = document.getElementById('user');

    async function call(path) {
      status.textContent = 'Requesting ' + path + ' as ' + user.value + '…';
      try {
        const response = await fetch(path, { headers: { 'x-demo-user': user.value } });
        const body = await response.json();
        output.textContent = response.status + '\\n' + JSON.stringify(body, null, 2);
        status.textContent = 'Completed. Review the request and response in Burp or browser developer tools.';
      } catch (error) {
        output.textContent = 'Request failed.\\n' + String(error);
        status.textContent = 'The browser could not complete the request. Check Docker health and the README troubleshooting section.';
      }
    }

    document.getElementById('mine').addEventListener('click', () => call('/api/my-orders'));
    document.getElementById('one').addEventListener('click', () => {
      const orderId = document.getElementById('order').value.trim();
      call('/api/orders/' + encodeURIComponent(orderId));
    });
  </script>
</body>
</html>`;

const server = http.createServer((request, response) => {
  const url = new URL(request.url ?? '/', 'http://localhost');

  if (request.method === 'GET' && url.pathname === '/health') {
    return sendJson(response, 200, { status: 'ok', synthetic: true });
  }

  if (request.method === 'GET' && url.pathname === '/') {
    response.writeHead(200, {
      'content-type': 'text/html; charset=utf-8',
      'cache-control': 'no-store',
      'x-content-type-options': 'nosniff'
    });
    return response.end(page);
  }

  const user = selectedUser(request);
  if (!user) {
    return sendJson(response, 401, { error: 'Select an approved synthetic user.' });
  }

  if (request.method === 'GET' && url.pathname === '/api/my-orders') {
    const owned = Object.values(orders).filter((order) => order.owner_id === user.id);
    return sendJson(response, 200, { user: user.id, orders: owned });
  }

  const match = url.pathname.match(/^\/api\/orders\/(order-[0-9]{3})$/);
  if (request.method === 'GET' && match) {
    const order = orders[match[1]];
    if (!order) {
      return sendJson(response, 404, { error: 'Synthetic order not found.' });
    }

    // Intentional training weakness: this route checks identity presence but not object ownership.
    return sendJson(response, 200, { requested_by: user.id, order });
  }

  return sendJson(response, 404, { error: 'Route not found.' });
});

server.listen(port, '0.0.0.0', () => {
  console.log(`NeoLabs synthetic access-control lab listening on ${port}`);
});
