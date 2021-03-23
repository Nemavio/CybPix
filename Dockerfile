FROM node:15

WORKDIR /usr/src/cybpix

RUN git clone Nemavio@github.com:15dev/PhotoSharing/PhotoSharing.git /usr/src/cybpix

RUN npm install

EXPOSE 80

CMD [ "node", "server.js" ]