FROM debian:stable-slim

COPY ./vsftpd.conf /

RUN apt-get update \
    && apt install vsftpd -y \
    && useradd -m teste \
    && mkdir -p /home/teste/ftp_directory \
    && chown nobody:nogroup /home/teste/ftp_directory \
    && chmod a-w /home/teste/ftp_directory \
    && mkdir -p /home/teste/ftp_directory/ftp_data \
    && chown teste:teste /home/teste/ftp_directory/ftp_data \
    && cd /home/teste/ftp_directory/ \
    && chmod -R 777 ftp_data \
    && mv /vsftpd.conf /etc/vsftpd.conf \
    && chown root:root /etc/vsftpd.conf \
    && setenforce 0
    && /etc/init.d/vsftpd restart 

ENTRYPOINT ["tail", "-f", "/dev/null"]

EXPOSE 21
    