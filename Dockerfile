FROM magvlab/base-wowza-image:latest

ENV WOWZA_ENGINE_VERSION 4.3.0

# install supervisor daemon
RUN apt-get clean && apt-get update && apt-get install -y curl supervisor

# well....
RUN curl -sSL http://stedolan.github.io/jq/download/linux64/jq -o /usr/local/bin/jq
RUN chmod +x /usr/local/bin/jq
COPY entrypoint.sh /entrypoint.sh

# install supervisor initiation script
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# install live stream config and transcode template
COPY live/ /usr/local/WowzaStreamingEngine/conf/live/
COPY templates/ /usr/local/WowzaStreamingEngine/transcoder/templates/

# install WowzaStreamingEngine and WowzaStreamingMananger init script
COPY wowza-engine-start.sh /usr/local/bin/wowza-engine-start
COPY wowza-manager-start.sh /usr/local/bin/wowza-manager-start

EXPOSE 21 80 443 554 1935 8083 8086 8087 8088

ENTRYPOINT ["/entrypoint.sh"]
