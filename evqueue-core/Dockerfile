# Stage 1: build
FROM debian:bullseye AS buildstage
ARG branch=master

# Prepare debian
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get update
RUN apt-get install -y apt-utils
RUN apt-get install -y build-essential cmake git default-libmysqlclient-dev  libgit2-dev libxerces-c-dev libzip-dev libwebsockets-dev

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
FROM debian:bullseye
RUN apt-get update
RUN apt-get install -y libmariadb3 libgit2-1.1 libxerces-c3.2 libzip4 libwebsockets16

# Prepare systems
COPY --from=buildstage /evqueue-core/build/evqueue /usr/local/bin
COPY evqueue.conf /etc
RUN groupadd evqueue
RUN useradd -g evqueue evqueue

# Launch evQueue
CMD /usr/local/bin/evqueue --config /etc/evqueue.conf --wait-db
EXPOSE 5000
EXPOSE 5001
EXPOSE 5002
