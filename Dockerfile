FROM node:15

RUN mkdir /root/.ssh/

ADD SSHKey4CybPix /root/.ssh/id_rsa

RUN touch /root/.ssh/known_hosts

RUN ssh-keyscan github.com >> /root/.ssh/known_hosts

RUN chmod 600 /root/.ssh/id_rsa

WORKDIR /usr/src/cybpix

RUN git clone git@github.com:15dev/PhotoSharing.git /usr/src/cybpix

RUN npm install

RUN npm install concurrently

EXPOSE 5000

CMD [ "yarn", "start" ]
