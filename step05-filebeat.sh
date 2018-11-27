docker run -d \
--net course_stack \
--name=filebeat \
--user=root \
--volume="/var/lib/docker/containers:/var/lib/docker/containers:ro" \
--volume="/root/course/filebeat.yml:/usr/share/filebeat/filebeat.yml:ro" \
--volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
docker.elastic.co/beats/filebeat:6.5.0 filebeat -e -strict.perms=false

