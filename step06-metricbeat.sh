docker run \
--net app_stack \
--net host docker.elastic.co/beats/metricbeat:6.5.1 \
setup -E setup.kibana.host=kibana:5601 \
-E output.elasticsearch.hosts=["elasticsearch:9200"]

docker run -d \
--net course_stack \
--name=metricbeat \
--user=root \
--volume="/root/course/metricbeat.yml:/usr/share/metricbeat/metricbeat.yml:ro" \
--volume="/var/run/docker.sock:/var/run/docker.sock:ro" \
--volume="/sys/fs/cgroup:/hostfs/sys/fs/cgroup:ro" \
--volume="/proc:/hostfs/proc:ro" \
--volume="/:/hostfs:ro" \
docker.elastic.co/beats/metricbeat:6.5.0 metricbeat -e

