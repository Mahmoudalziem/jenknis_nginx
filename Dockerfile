FROM nginx:latest
#####
USER root
COPY application/ /usr/share/nginx/html/
LABEL name="Mahmoud Abd Alziem" \
      age="24" \
      faculty="FCI"
ENV NAME=TEST \
    AGE=24
#ADD application/* /usr/share/nginx/html/
WORKDIR /usr/share/nginx/html
RUN apt-get update -y
EXPOSE 80/tcp 443/tcp
#VOLUME [ "/data" ]
#ENTRYPOINT [ "echo",${NAME}]
#CMD ["echo",${AGE}]