FROM alpine:3.16 as installation
RUN apk add git nodejs npm
ARG mfc_version
ENV MFC_VERSION=$mfc_version
RUN npm i -g --omit=dev   @ziemniakoss/mfc@$MFC_VERSION
RUN ln $(which mfc) /usr/local/bin/sfdx

CMD ["sh"]

