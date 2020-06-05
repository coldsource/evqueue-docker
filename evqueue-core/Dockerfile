# Stage 1: build
FROM debian:buster AS buildstage
ARG branch=master

# Prepare debian
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential cmake git libmariadbclient-dev libgit2-dev libxerces-c-dev libpcre++-dev libzip-dev libwebsockets-dev

# Clone git repository
RUN git clone https://github.com/coldsource/evqueue-core.git
WORKDIR /evqueue-core
RUN git fetch -a
RUN git checkout $branch
RUN mkdir build

# Build evQueue
WORKDIR /evqueue-core/build
RUN cmake ..
RUN make

# Stage 2: run
FROM debian:buster
RUN apt-get update
RUN apt-get install -y libmariadb3 libgit2-27 libxerces-c3.2 libpcre++0v5 libpcrecpp0v5 libzip4 libwebsockets8

# Prepare systems
COPY --from=buildstage /evqueue-core/build/evqueue /usr/local/bin
COPY evqueue.conf /etc
RUN groupadd evqueue
RUN useradd -g evqueue evqueue

# Purge unusged elements
RUN apt-get remove -y --purge build-essential cmake
RUN apt-get autoremove -y --purge

# Launch evQueue
CMD /usr/local/bin/evqueue --config /etc/evqueue.conf --wait-db
EXPOSE 5000
EXPOSE 5001
