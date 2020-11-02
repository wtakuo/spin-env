
FROM ubuntu as spinbuilder
WORKDIR /root/
RUN apt-get update \
 && apt-get install -y git build-essential byacc \
 && git clone https://github.com/nimble-code/Spin.git \
        --branch version-6.5.2 --depth 1 \
 && (cd Spin/Src; make)
 
FROM ubuntu

LABEL maintainer="takuo@c.titech.ac.jp"

ARG TZ=UTC
ARG USER=spin
ARG GROUP=spin
ARG PASS=spin
ENV HOME=/home/${USER}

COPY --from=spinbuilder /root/Spin/Src/spin /usr/local/bin/
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata \
 && ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime \
 && dpkg-reconfigure --frontend noninteractive tzdata \
 && DEBIAN_FRONTEND=noninteractive apt-get install -y \
      sudo \
      git \
      build-essential \
 && rm -rf /var/lib/apt/lists/* \
 && groupadd ${GROUP} \
 && useradd -g ${GROUP} -m ${USER} \
 && (echo "${USER}:${PASS}" | chpasswd) \
 && gpasswd -a ${USER} sudo 

USER ${USER}
WORKDIR ${HOME}

ENTRYPOINT ["/bin/bash"]
