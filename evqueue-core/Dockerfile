FROM debian:stretch
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential cmake git libmariadbclient-dev libgit2-dev libxerces-c-dev libpcre++-dev
RUN git clone https://github.com/coldsource/evqueue-core.git
WORKDIR /evqueue-core
RUN mkdir build
WORKDIR /evqueue-core/build
RUN cmake ..
RUN make
COPY evqueue.conf /etc
RUN groupadd evqueue
RUN useradd -g evqueue evqueue
RUN apt-get remove -y --purge build-essential cmake
RUN apt-get autoremove -y --purge
CMD /evqueue-core/build/evqueue --config /etc/evqueue.conf
EXPOSE 5000
