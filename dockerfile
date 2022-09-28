FROM debian:stable-slim

COPY ./vsftpd.conf /

RUN apt-get update \
    && apt install vsftpd -y \
    && mv /vsftpd.conf /etc/vsftpd.conf \
    && chown root:root /etc/vsftpd.conf \
    && /etc/init.d/vsftpd restart 

CMD ["/usr/sbin/vsftpd"]


EXPOSE 21
    
