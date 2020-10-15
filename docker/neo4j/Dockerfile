FROM neo4j

RUN apt-get update
RUN apt-get install -y curl
COPY init.cypher /tmp/init.cypher
COPY background.sh /tmp/background.sh
COPY init.sh /tmp/init.sh
RUN chmod -v +x /tmp/background.sh
RUN chmod -v +x /tmp/init.sh
