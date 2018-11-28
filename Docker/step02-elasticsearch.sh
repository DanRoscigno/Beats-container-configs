docker run -d \
  --name=elasticsearch \
  --label co.elastic.logs/module=elasticsearch \
  --label co.elastic.metrics/module=elasticsearch \
  --label co.elastic.metrics/hosts='${data.host}:9200' \
  --env="discovery.type=single-node" \
  --env="ES_JAVA_OPTS=-Xms256m -Xmx256m" \
  --network=course_stack \
  -p 9300:9300 -p 9200:9200 \
  --health-cmd='curl -s -f http://localhost:9200/_cat/health' \
  docker.elastic.co/elasticsearch/elasticsearch:6.5.1 
