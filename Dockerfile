# Distributed under the MIT license - https://opensource.org/licenses/MIT
FROM debian:stretch-slim 

ENV VERSION 0.18.2
ENV CHECKSUM 28d8511789a126aff16e256a03288948f2660c3c8cb0a4c809c5a8618a519a16

COPY bitcoin.conf /opt/bitcoin/bitcoin.conf
VOLUME /opt/bitcoin/regtest
ADD https://github.com/bitcoin-sv/bitcoin-sv/releases/download/v0.1.0/bitcoin-sv-0.1.0-x86_64-linux-gnu.tar.gz /tmp/bu.tar.gz

RUN cd /tmp \
  && echo "$CHECKSUM  bu.tar.gz" | sha256sum -c - \
  && tar -xzvf bu.tar.gz -C /usr/local --strip-components=1 --exclude=*-qt \
  && rm bu.tar.gz

EXPOSE 18332 18333

CMD ["bitcoind", "-conf=/opt/bitcoin/bitcoin.conf"]
