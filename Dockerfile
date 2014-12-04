FROM busybox:ubuntu-14.04
MAINTAINER Tobias Sarnowski <tobias@sarnowski.io>

ADD dist/java /java

env JAVA_HOME /java
env PATH ${PATH}:/${JAVA_HOME}/bin
