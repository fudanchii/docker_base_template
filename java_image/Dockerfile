FROM fudanchii/base:latest
MAINTAINER Nurahmadie <nurahmadie@gmail.com>


ADD install.sh /bin/
RUN /bin/install.sh
ADD drone.key /home/ubuntu/

ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
ENV GRADLE_HOME /usr/share/gradle-2.2.1
ENV MAVEN_HOME /usr/share/apache-maven-3.3.3
ENV PATH $MAVEN_HOME/bin:$GRADLE_HOME/bin:$PATH

ENTRYPOINT ["/bin/sh"]
