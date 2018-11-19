FROM jirikulik/mymlworker

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get install --quiet --yes xterm mate-desktop-environment-core

ENV NOMACHINE_PACKAGE_NAME nomachine_6.3.6_1_amd64.deb
ENV NOMACHINE_BUILD 6.3
ENV NOMACHINE_MD5 6a30a4ee607848685941cf3b575eb0e9

RUN curl -fSL "http://download.nomachine.com/download/${NOMACHINE_BUILD}/Linux/${NOMACHINE_PACKAGE_NAME}" -o nomachine.deb \
    && echo "${NOMACHINE_MD5} *nomachine.deb" | md5sum -c - && dpkg -i nomachine.deb \
    && sed -i "s|#EnableClipboard both|EnableClipboard both |g" /usr/NX/etc/server.cfg \
    && rm nomachine.deb

ADD nxserver.sh /
ADD activateconda.sh /
RUN chmod +x /nxserver.sh && \
    chmod +x /activateconda.sh

ENTRYPOINT ["/entrypoint.sh", "/nxserver.sh"]
