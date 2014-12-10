FROM ubuntu:latest
MAINTAINER Tobias Sarnowski <tobias@sarnowski.io>

ADD dist/java /java

env JAVA_HOME /java
env PATH ${PATH}:/${JAVA_HOME}/bin
