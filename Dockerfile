FROM node:16-alpine3.16 as installation
COPY docker_scripts/compressPackageJsons.js /compressPackageJsons.js
RUN npm i -g pnpm
RUN pnpm config set store-dir /pnpmcache
RUN pnpm config set global-bin-dir /usr/bin/pnpm
ENV PATH=$PATH:/usr/bin/pnpm
ARG mfc_version
ENV MFC_VERSION=$mfc_version
RUN pnpm i -g --prod @ziemniakoss/mfc@$MFC_VERSION
RUN find /root/.local/share/pnpm -type f \(  \
    -iname "README.*"  \
    -o -iname "CHANGELOG*"  \
    -o -iname "HISTORY*" \
    -o -iname "makefile" \
    -o -iname "CONTRIBUTING*"  \
    -o -iname "*.ts"  \
    -o -iname "*.js.map"  \
    -o -iname "*.lock.json"  \
    -o -iname "yarn.lock" \
    -o -name "npm-shrinkwrap.json"  \
    -o -name "tsconfig.json"  \
    -o -iname "*.yml"  \
    -o -name ".*" \
    -o -name "oclif.manifest.json" \
\) -delete
RUN find /root/.local/share/pnpm -name "package.json" -exec node /compressPackageJsons.js {} \;

FROM alpine:3.16
RUN apk add nodejs git
COPY --from=installation /usr/bin/pnpm /usr/bin/pnpm
COPY --from=installation /root/.local/share/pnpm  /root/.local/share/pnpm
ENV PATH=$PATH:/usr/bin/pnpm
RUN ln $(which mfc) /bin/sfdx
CMD ["sh"]
