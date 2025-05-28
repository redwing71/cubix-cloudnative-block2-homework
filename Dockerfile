FROM quay.io/drsylent/cubix/block2/homework-base:java21 AS backapp
ENV CUBIX_HOMEWORK="Zsolt Rituper"
LABEL cubix.homework.owner="${CUBIX_HOMEWORK}"
ENV APP_DEFAULT_MESSAGE=
RUN mkdir /opt/app && chown 1001 -R /opt/app
USER 1001
WORKDIR /opt/app
COPY --chown=1001 backapp/target/*.jar app.jar
CMD ["java", "-jar", "app.jar", "--server.port=8081"]

FROM quay.io/drsylent/cubix/block2/homework-base:java21 AS frontapp
ENV CUBIX_HOMEWORK="Zsolt Rituper"
LABEL cubix.homework.owner="${CUBIX_HOMEWORK}"
ENV APP_DEFAULT_MESSAGE=
ENV BACK_URL=
RUN mkdir /opt/app && chown 1001 -R /opt/app
USER 1001
WORKDIR /opt/app
COPY --chown=1001 frontapp/target/*.jar app.jar
CMD ["java", "-jar", "app.jar", "--back.url=${BACK_URL}"]
