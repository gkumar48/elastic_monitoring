#!/usr/local/bin/python

import json
import requests

stats = requests.get('http://localhost:9200/_nodes/stats?all').json()

if (stats is not None):
	nodes_data = stats['nodes']
	if (nodes_data is not None):
		bulk_data = ''
		for node_id in nodes_data:
			node_data = nodes_data[node_id]
			node_name = node_data['name']
			if (node_name is not None and node_data is not None):
				bulk_data += '{"index": {"_index": "nodes_stats", "_type": "' + node_name + '"}}\n'
				bulk_data += json.dumps(node_data) + '\n'
		if (bulk_data != ''):
			response = requests.post('http://localhost:9200/_bulk', data=bulk_data)

