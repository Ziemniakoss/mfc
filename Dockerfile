FROM node:16-alpine3.16 as ala
RUN npm i -g pnpm
RUN pnpm config set store-dir /pnpmcache
RUN pnpm config set global-bin-dir /usr/bin/pnpm
ENV PATH=$PATH:/usr/bin/pnpm
ARG mfc_version
ENV MFC_VERSION=$mfc_version
RUN pnpm i -g --omit=dev @ziemniakoss/mfc@$MFC_VERSION
RUN pnpm i -g --prod @ziemniakoss/mfc
RUN echo -e "#!/bin/sh\nmfc \$@\n" > /bin/sfdx
RUN chmod +x /bin/sfdx
RUN npm remove -g pnpm

FROM alpine:3.16
RUN apk add nodejs
COPY --from=ala /usr/bin/pnpm /usr/bin/pnpm
COPY --from=ala /root/.local/share/pnpm  /root/.local/share/pnpm
ENV PATH=$PATH:/usr/bin/pnpm
CMD ["sh"]
