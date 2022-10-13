FROM node:alpine3.15
ARG mfc_version
ENV MFC_VERSION=$mfc_version
RUN echo $MFC_VERSION
RUN npm i -g --omit=dev @ziemniakoss/mfc@$MFC_VERSION
RUN echo -e "#!/bin/sh\nmfc \$@\n" > /bin/sfdx
RUN chmod +x /bin/sfdx
ENTRYPOINT ["sh"]
