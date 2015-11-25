#!/bin/bash

NODE=$(curl -sSL localhost:29091/info | jq -r '.node')

ln -s /usr/local/WowzaStreamingEngine/applications/live /usr/local/WowzaStreamingEngine/applications/${NODE}
ln -s /usr/local/WowzaStreamingEngine/conf/live /usr/local/WowzaStreamingEngine/conf/${NODE}

exec /usr/bin/supervisord
