docker run \
--cap-add=NET_ADMIN \
--net course_stack \
docker.elastic.co/beats/packetbeat:6.5.1 \
setup -E setup.kibana.host=kibana:5601 \
-E output.elasticsearch.hosts=["elasticsearch:9200"]

docker run -d \
  --name=packetbeat \
  --user=packetbeat \
  --volume="$(pwd)/single-configs/packetbeat.yml:/usr/share/packetbeat/packetbeat.yml:ro" \
  --cap-add="NET_RAW" \
  --cap-add="NET_ADMIN" \
  --network=host \
  docker.elastic.co/beats/packetbeat:6.5.1 \
  --strict.perms=false -e -E output.elasticsearch.hosts=http://localhost:9200

