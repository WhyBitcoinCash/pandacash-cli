# Distributed under the MIT license - https://opensource.org/licenses/MIT
FROM debian:stretch-slim 

ENV VERSION 0.18.2

COPY bitcoin.conf /opt/bitcoin/bitcoin.conf
VOLUME /opt/bitcoin/regtest
ADD https://github.com/bitcoin-sv/bitcoin-sv/releases/download/v0.1.0/bitcoin-sv-0.1.0-x86_64-linux-gnu.tar.gz /tmp/bu.tar.gz

RUN cd /tmp \

  && tar -xzvf bu.tar.gz -C /usr/local --strip-components=1 --exclude=*-qt \
  && rm bu.tar.gz

EXPOSE 18332 18333

CMD ["bitcoind", "-conf=/opt/bitcoin/bitcoin.conf"]
