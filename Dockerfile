FROM        node:18
RUN         mkdir /app
WORKDIR     /app
COPY        node_modules /app/node_modules/
COPY        package.json /app/package.json
COPY        server.js /app/server.js
ADD         https://truststore.pki.rds.amazonaws.com/global/global-bundle.pem /app/rds-combined-ca-bundle.pem
COPY        run.sh /app/run.sh
ENTRYPOINT  ["bash", "/app/run.sh"]