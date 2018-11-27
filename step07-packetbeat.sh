docker run \
--cap-add=NET_ADMIN \
--net course_stack \
docker.elastic.co/beats/packetbeat:6.4.2 \
setup -E setup.kibana.host=kibana:5601 \
-E output.elasticsearch.hosts=["elasticsearch:9200"]

docker run -d \
  --name=packetbeat \
  --user=packetbeat \
  --volume="$(pwd)/configs/packetbeat.yml:/usr/share/packetbeat/packetbeat.yml:ro" \
  --cap-add="NET_RAW" \
  --cap-add="NET_ADMIN" \
  --network=host \
  docker.elastic.co/beats/packetbeat:6.4.2 \
  --strict.perms=false -e -E output.elasticsearch.hosts=http://localhost:9200

