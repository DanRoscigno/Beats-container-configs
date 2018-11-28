docker run \
  --net course_stack \
  docker.elastic.co/beats/heartbeat:6.5.1 \
  setup -E setup.kibana.host=kibana:5601 \
  -E output.elasticsearch.hosts=["elasticsearch:9200"]

docker run -d \
  --name=heartbeat \
  --user=heartbeat \
  --volume="/Users/droscign/Projects/stack-docker/scripts/setup-beat.sh:/usr/local/bin/setup-beat.sh:ro" \
  --volume="$(pwd)/single-configs/heartbeat.yml:/usr/share/heartbeat/heartbeat.yml:ro" \
  --net course_stack \
  docker.elastic.co/beats/heartbeat:6.5.1 \
  --strict.perms=false -e
