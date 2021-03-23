ARG SSHKey4CybPix

FROM node:15

WORKDIR /usr/src/cybpix

RUN mkdir /root/.ssh/

RUN cat $SSHKey4CybPix

COPY $SSHKey4CybPix /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts

RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN chmod 600 /root/.ssh/id_rsa

RUN cat /root/.ssh/id_rsa

RUN git clone git@github.com:15dev/PhotoSharing/PhotoSharing.git /usr/src/cybpix

RUN npm install

EXPOSE 80

CMD [ "node", "server.js" ]
