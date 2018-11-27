docker run \
--net course_stack \
docker.elastic.co/beats/filebeat:6.5.1 \
setup -E setup.kibana.host=kibana:5601 \
-E output.elasticsearch.hosts=["elasticsearch:9200"]

docker run -d \
--net course_stack \
--name=filebeat \
--user=root \
--volume="/var/lib/docker/containers:/var/lib/docker/containers:ro" \
--volume="$(pwd)/configs/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro" \
--volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
docker.elastic.co/beats/filebeat:6.5.1 filebeat -e -strict.perms=false

