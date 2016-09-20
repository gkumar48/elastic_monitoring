Creating dashboards using Elastic Search and Kibana

Steps

1. Create the mapping
./scripts/create_index.sh <elastic host> <port>

2. Make sure you see the index in elastic search before proceeding

3. Setup the crontab
sudo crontab -e
* * * * * /path/to/push_node_stats.sh

4. Import Dasboard in Kibana
