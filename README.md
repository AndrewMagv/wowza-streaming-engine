# Wowza Streaming docker box
WowzaStreamingEngine + WowzaStreamingManager docker image

## Disclaimer
The base image specified in the *Dockerfile* is a custom build of
WowzaStreamingEngine *MagVLab* obtianed from Wowza media systems.

We do not redistribute the base image due to licensing.  That said, building
your own base image is straight forward.

WowzaStreamingEngine is a licensed software.  Review license limits first
before starting your multi-instance group.

## How to Run
**WowzaStreamingEngine** and **WowzaStreamingManager** are managed by process
daemon **supervisord**.

The default behavior starts WowzaStreamingEngine to listen for incomming
streams.  To start the manager, run `docker exec` into container and
`supervisorctl start WowzaStreamingMananger`.  See how to configure start and
runtime behavior at their doc site
[supervisord](http://supervisord.org/introduction.html).

## How to build
Start with [ubuntu](https://hub.docker.com/_/ubuntu/).  WowzaStreamingEngine
provides installer for text mode installation.  Follow link to
[Wowza media systems](https://www.wowza.com/pricing/installer).
