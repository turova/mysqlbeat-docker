FROM ubuntu:17.04

# Install wget (used to pull down beta release of mysqlbeat)
RUN apt-get update && apt-get install -y git golang golang-glide

RUN mkdir -p ~/.go/src/github.com/adibendahan && \
    export GOPATH=/root/.go && export GOROOT=/usr/lib/go-1.7/ && \
    cd ~/.go/src/github.com/adibendahan && \
    git clone https://github.com/adibendahan/mysqlbeat && cd mysqlbeat && git checkout 1.0.0 && \
    glide update --no-recursive && \
    make && \
    cp mysqlbeat /usr/bin/

# A clean-up step may be good here

ENTRYPOINT ["/usr/bin/mysqlbeat", "-e"]
