FROM node:lts-alpine@sha256:a9b9cb880fa429b0bea899cd3b1bc081ab7277cc97e6d2dcd84bd9753b2027e1 AS development

WORKDIR /usr/src/app


COPY  . .

RUN npm install glob rimraf

RUN npm install --only=development

COPY . .

RUN npm run build


FROM node:lts-alpine@sha256:a9b9cb880fa429b0bea899cd3b1bc081ab7277cc97e6d2dcd84bd9753b2027e1 as production


RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app


COPY  . .


RUN npm install

RUN cd ./build && npm install

RUN cd ./ &&  npm install

RUN mkdir -p /usr/src/app/

RUN cp -r ./build/* ./

WORKDIR  /usr/src/app/



EXPOSE 3000

COPY . .

CMD ["node", "dist/main"]
