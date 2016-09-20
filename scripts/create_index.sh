#!/bin/bash

host=$1
port=$2

curl -XPUT "http://$host:$port/nodes_stats" -d '
{
    "settings" : {
        "number_of_shards" : 1,
        "number_of_replicas" : 1
    },
    "mappings" : {
        "_default_" : {
            "_all" : {"enabled" : false},
            "_ttl" : {
                "enabled" : true,
                "default" : "60d"
            },
            "dynamic_templates" : [
            {
                "timestamps_as_date" : {
                    "match_pattern" : "regex",
                    "path_match" : ".*timestamp",
                    "mapping" : {
                        "type" : "date"
                    }
                }
            },
            {
                "strings_not_analyzed" : {
                    "match" : "*",
                    "match_mapping_type" : "string",
                    "mapping" : {
                        "type" : "string",
                        "index" : "not_analyzed"
                    }
                }
            }
            ]
        }
    }
}'

