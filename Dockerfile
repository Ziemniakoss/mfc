FROM node:16-alpine3.16 as installation
RUN npm i -g pnpm
RUN pnpm config set store-dir /pnpmcache
RUN pnpm config set global-bin-dir /usr/bin/pnpm
ENV PATH=$PATH:/usr/bin/pnpm
ARG mfc_version
ENV MFC_VERSION=$mfc_version
RUN pnpm i -g --prod @ziemniakoss/mfc@$MFC_VERSION

FROM alpine:3.16
RUN apk add nodejs
COPY --from=installation /usr/bin/pnpm /usr/bin/pnpm
COPY --from=installation /root/.local/share/pnpm  /root/.local/share/pnpm
ENV PATH=$PATH:/usr/bin/pnpm
RUN echo -e "#!/bin/sh\nmfc \$@\n" > /bin/sfdx
RUN chmod +x /bin/sfdx
CMD ["sh"]
