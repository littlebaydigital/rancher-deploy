FROM debian:latest

MAINTAINER Allan Denot <adenot@microverse.cloud>

ENV RANCHER_CLI_VERSION v0.6.3-rc2

RUN apt-get -yqq update && \
		apt-get install -yqq --no-install-recommends ca-certificates wget && \
		wget -qO- https://github.com/rancher/cli/releases/download/${RANCHER_CLI_VERSION}/rancher-linux-amd64-${RANCHER_CLI_VERSION}.tar.gz | tar xvz -C /tmp && \
		mv /tmp/rancher-${RANCHER_CLI_VERSION}/rancher /usr/local/bin/rancher && \
		chmod +x /usr/local/bin/rancher

RUN apt-get -yqq autoremove && \
		apt-get -yqq clean && \
		rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /var/tmp/*

WORKDIR /workspace

ENTRYPOINT ["/usr/local/bin/rancher"]
