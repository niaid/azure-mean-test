
FROM node

WORKDIR /opt/mean-test

COPY app /opt/mean-test

RUN yarn

EXPOSE 8080 

CMD [ "yarn", "start" ]
