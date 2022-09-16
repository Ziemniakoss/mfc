FROM node:alpine3.15
ARG mfc_version
RUN npm i -g --production @ziemniakoss/mfc
ENTRYPOINT ["sh"]
