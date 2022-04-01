FROM  opennetworklinux/builder10:1.2

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
    && sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' \
    && apt-get --allow-releaseinfo-change update \
    && apt-get install -y google-chrome-unstable \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

RUN openssl s_client -connect mirrors.kernel.org:443

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -qy apt-transport-https ed libelf-dev python-pip ca-certificates apt-cacher-ng
# Install Docker cli
RUN wget -O /tmp/docker.tgz https://download.docker.com/linux/static/stable/x86_64/docker-19.03.9.tgz && tar xf /tmp/docker.tgz -C /tmp && mv /tmp/docker/docker /usr/bin/ && rm -rf /tmp/*

RUN git clone https://github.com/AgentD/squashfs-tools-ng.git && cd squashfs-tools-ng && ./autogen.sh && ./configure && make && make install && ldconfig
