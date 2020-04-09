FROM node:alpine as builder
WORKDIR /app
COPY /app .
RUN npm install && npm run build

FROM node:alpine
RUN npm install --global serve
WORKDIR /app
COPY --from=builder /app/build .
CMD ["serve", "-p", "80", "-s", "."]