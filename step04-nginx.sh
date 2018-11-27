docker run --name=redis-master \
  --label co.elastic.logs/module=redis \
  --label co.elastic.logs/fileset.stdout=log \
  --label co.elastic.metrics/module=redis \
  --label co.elastic.metrics/metricsets="info, keyspace" \
  --label co.elastic.metrics/hosts='${data.host}:${data.port}' \
  --env="GET_HOSTS_FROM=dns" \
  --env="HOME=/root" \
  --volume="/data" \
  --network=course_stack \
  --label com.docker.compose.service="redis-master" \
  --detach=true \
  gcr.io/google_containers/redis:e2e redis-server /etc/redis/redis.conf


docker run --name=redis-slave \
  --label co.elastic.logs/module=redis \
  --label co.elastic.logs/fileset.stdout=log \
  --label co.elastic.metrics/module=redis \
  --label co.elastic.metrics/metricsets="info, keyspace" \
  --label co.elastic.metrics/hosts='${data.host}:${data.port}' \
  --env="GET_HOSTS_FROM=dns" \
  --volume="/data" \
  --network=course_stack \
  --label com.docker.compose.service="redis-slave" \
  --detach=true \
  gcr.io/google_samples/gb-redisslave:v1 /bin/sh -c /run.sh


docker run \
  --name=frontend \
  --label co.elastic.logs/module=apache2 \
  --label co.elastic.logs/fileset.stdout=access \
  --label co.elastic.logs/fileset.stderr=error \
  --label co.elastic.metrics/module=apache \
  --label co.elastic.metrics/metricsets=status \
  --label co.elastic.metrics/hosts='${data.host}:${data.port}' \
  -v $(pwd)/configs/apache2.conf:/etc/apache2/apache2.conf:ro \
  -v $(pwd)/configs/apache-mod-status.conf:/etc/apache2/mods-available/status.conf:ro \
  -v $(pwd)/configs/remoteip.load:/etc/apache2/mods-enabled/remoteip.load:ro \
  --env="GET_HOSTS_FROM=dns" \
  --network=course_stack \
  --label com.docker.compose.service="frontend" \
  --detach=true \
  -p 80:80 \
  gcr.io/google-samples/gb-frontend:v4 apache2-foreground

