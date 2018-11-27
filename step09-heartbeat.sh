docker run \
  --net course_stack \
  docker.elastic.co/beats/heartbeat:6.4.2 \
  setup -E setup.kibana.host=kibana:5601 \
  -E output.elasticsearch.hosts=["elasticsearch:9200"]

docker run -d \
  --name=heartbeat \
  --user=heartbeat \
  --volume="/Users/droscign/Projects/stack-docker/scripts/setup-beat.sh:/usr/local/bin/setup-beat.sh:ro" \
  --volume="$(pwd)/configs/heartbeat.yml:/usr/share/heartbeat/heartbeat.yml:ro" \
  --net course_stack \
  docker.elastic.co/beats/heartbeat:6.4.2 \
  --strict.perms=false -e
