FROM node as osinit

RUN apt update && apt upgrade

RUN apt -y install git

# RUN git config --global user.email
# RUN git config --global user.name

RUN yarn global add @vue/cli @vue/cli-service-global

WORKDIR /app

FROM osinit as init

RUN vue create --default --registry  https://registry.npm.taobao.org project

WORKDIR /app/project

RUN yarn install

EXPOSE 8080

CMD yarn serve

#FROM osinit as development

#VOLUME

# git cloneでは?

#FROM osinit as production

#RUN yarn add --dev pm2

#CMD node_modules/pm2/bin/pm2 --no-daemon start index.js

