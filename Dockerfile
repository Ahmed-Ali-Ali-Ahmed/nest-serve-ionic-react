FROM node:lts-alpine@sha256:a9b9cb880fa429b0bea899cd3b1bc081ab7277cc97e6d2dcd84bd9753b2027e1 as development

WORKDIR /usr/src/app


COPY  . .

RUN npm install 

COPY . .

RUN npm run build




EXPOSE 3000

CMD ["node", "dist/main"]
