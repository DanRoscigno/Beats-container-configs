docker run \
  --cap-add="AUDIT_CONTROL" \
  --cap-add="AUDIT_READ" \
  --net course_stack \
  docker.elastic.co/beats/auditbeat:6.4.2 \
  setup -E setup.kibana.host=kibana:5601 \
  -E output.elasticsearch.hosts=["elasticsearch:9200"]

docker run -d \
  --name=auditbeat \
  --user=root \
  --volume="$(pwd)/configs/auditbeat.yml:/usr/share/packetbeat/auditbeat/auditbeat.yml:ro" \
  --cap-add="AUDIT_CONTROL" \
  --cap-add="AUDIT_READ" \
  --pid=host \
  --network=course_stack \
  docker.elastic.co/beats/auditbeat:6.4.2 -e \
  --strict.perms=false

