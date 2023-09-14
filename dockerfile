FROM node AS build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
RUN ls
RUN ls dist/

FROM nginx
COPY --from=build /app/dist/aravind-app/ /usr/share/nginx/html/
