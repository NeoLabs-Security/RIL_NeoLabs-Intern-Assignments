FROM node:22.22.0-alpine3.22

WORKDIR /app
COPY --chown=node:node server.mjs ./server.mjs

USER node
EXPOSE 3000
CMD ["node", "server.mjs"]
