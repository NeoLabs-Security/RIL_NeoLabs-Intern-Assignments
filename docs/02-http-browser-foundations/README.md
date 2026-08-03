# Module 2 — HTTP, Browsers and API Foundations

## Purpose

Web penetration testing depends on understanding how browsers and servers exchange messages. Tools such as Burp Suite make these messages visible, but the analyst must understand the underlying protocol before interpreting them.

## Learning outcomes

An intern should be able to:

- identify the method, path, query string, headers and body of an HTTP request;
- interpret common response status codes;
- explain cookies, sessions, bearer tokens and browser storage;
- distinguish client-side validation from server-side enforcement;
- recognise JSON, form and multipart request bodies;
- map a browser action to the network requests it creates;
- describe same-origin, CORS and CSRF concepts at an introductory level;
- record a request and response without exposing secrets.

## Request anatomy

```http
POST /api/session HTTP/1.1
Host: lab.local
Content-Type: application/json
Accept: application/json

{"username":"learner01","password":"[REDACTED]"}
```

- `POST` is the method.
- `/api/session` is the path.
- `Host` identifies the intended virtual host.
- `Content-Type` describes the body format.
- `Accept` describes the preferred response format.
- The blank line separates headers from the body.

## Methods

| Method | Typical purpose | Testing question |
|---|---|---|
| GET | Retrieve a representation | Is access checked for every object requested? |
| POST | Create or trigger an action | Does the server validate all submitted fields? |
| PUT | Replace a resource | Can a lower role overwrite fields it should not control? |
| PATCH | Partially update a resource | Are sensitive properties protected from mass assignment? |
| DELETE | Remove a resource | Is deletion authorised and auditable? |
| OPTIONS | Describe supported communication | Does it reveal unexpected methods or CORS behaviour? |

Method names do not guarantee behaviour. The server implementation is authoritative.

## Status codes

- `200 OK`: request completed successfully.
- `201 Created`: a resource was created.
- `204 No Content`: request succeeded without a response body.
- `301/302`: redirect.
- `400 Bad Request`: malformed or rejected input.
- `401 Unauthorized`: authentication is absent or invalid.
- `403 Forbidden`: identity is known but not permitted.
- `404 Not Found`: resource is unavailable or deliberately concealed.
- `409 Conflict`: request conflicts with current state.
- `429 Too Many Requests`: rate limit applied.
- `500` range: server-side failure.

A status code is evidence, but not the whole conclusion. Always inspect the response body and resulting application state.

## Parameters and data locations

A value may appear in:

- path: `/api/users/17`;
- query: `/api/search?q=invoice`;
- header: `Authorization: Bearer ...`;
- cookie: `session=...`;
- JSON body;
- form body;
- multipart upload;
- browser local or session storage.

Mapping every input location is essential because controls may be applied inconsistently.

## Cookies and sessions

A cookie may identify a server-side session or carry a signed token. Important attributes include:

- `Secure`: cookie should be sent only over HTTPS;
- `HttpOnly`: browser scripts cannot directly read it;
- `SameSite`: influences cross-site requests;
- `Path` and `Domain`: limit where the cookie is sent;
- expiry or maximum age.

Do not paste real session values into reports. Record only a short redacted identifier when correlation is necessary.

## Bearer tokens

A bearer token grants access to whoever possesses it. Treat it like a password. During testing, confirm where it is stored, how it expires, whether logout invalidates it and whether server-side authorization still checks each requested action.

## Client-side versus server-side controls

A disabled button, hidden menu or JavaScript validation rule can improve user experience, but it is not a security boundary. A server must independently verify identity, permission, object ownership and input validity.

## JSON and APIs

Example response:

```json
{
  "id": "order-102",
  "owner_id": "learner-01",
  "status": "draft"
}
```

During mapping, record:

- endpoint and method;
- authentication requirement;
- role used;
- request fields;
- response fields;
- object identifiers;
- error behaviour;
- state changes;
- related endpoints.

## Browser security concepts

### Same-origin policy

Browsers generally isolate content by scheme, host and port. This limits how one origin can read another origin's data.

### CORS

Cross-Origin Resource Sharing allows a server to explicitly permit selected cross-origin browser requests. CORS is a browser access policy, not a substitute for authentication or authorization.

### CSRF

Cross-site request forgery occurs when a browser is induced to send an authenticated state-changing request that the application does not adequately verify. Testing must remain within the approved synthetic lab and must not involve real users.

## Practical mapping exercise

1. Open browser developer tools and the Burp HTTP history.
2. Sign in using an operator-issued synthetic account.
3. Perform one normal action at a time.
4. Match each interface action to its request and response.
5. Record the endpoint, method, parameters, status code and state change.
6. Mark authentication and role requirements.
7. Do not alter requests until the normal workflow is understood.

## Common beginner mistakes

- assuming every `403` proves the entire feature is secure;
- testing an identifier without confirming which synthetic user owns it;
- treating browser validation as server validation;
- reporting a verbose error without showing security impact;
- sharing cookies or authorization headers in screenshots;
- sending repeated requests before understanding the first response.

## Review questions

1. Why is a hidden browser button not an authorization control?
2. Where can HTTP input values appear?
3. What is the difference between authentication and authorization?
4. Why must bearer tokens be redacted?
5. How would you map a normal password-change workflow before testing it?

## Authoritative basis

- OWASP Web Security Testing Guide v4.2.
- MDN Web Docs for HTTP, cookies, CORS and browser security concepts.
- PortSwigger Burp Suite documentation for Proxy, HTTP history, Repeater and target scope.
