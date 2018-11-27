docker run \
--cap-add=NET_ADMIN \
--net course_stack \
--net host docker.elastic.co/beats/packetbeat:6.5.1 \
setup -E setup.kibana.host=kibana:5601 \
-E output.elasticsearch.hosts=["elasticsearch:9200"]

docker run -d \
--name=packetbeat \
--cap-add=NET_ADMIN  \
--volume "$(pwd)/configs/packetbeat.yml:/usr/share/packetbeat/packetbeat.yml:ro" \
docker.elastic.co/beats/packetbeat:6.5.1 -e

