FROM node:15

RUN mkdir /root/.ssh/

ADD SSHKey4CybPix /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts

RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN chmod 600 /root/.ssh/id_rsa

RUN cat /root/.ssh/id_rsa

WORKDIR /usr/src/cybpix

RUN git clone git@github.com:15dev/PhotoSharing/PhotoSharing.git /usr/src/cybpix

RUN npm install

EXPOSE 80

CMD [ "node", "server.js" ]
