FROM quay.io/drsylent/cubix/block2/homework-base:java21
ARG FROMAPP
ENV CUBIX_HOMEWORK="Zsolt Rituper"
ENV APP_DEFAULT_MESSAGE=
LABEL cubix.homework.owner="${CUBIX_HOMEWORK}"
RUN mkdir /opt/app && chown 1001 -R /opt/app
USER 1001
WORKDIR /opt/app
COPY --chown=1001 ${FROMAPP}/target/*.jar app.jar
CMD ["java", "-jar", "app.jar"]