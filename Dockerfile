
FROM node

WORKDIR /opt/mean-test

COPY app /opt/mean-test

RUN yarn

EXPOSE 3000 

CMD [ "yarn", "start" ]
