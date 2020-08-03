FROM node
RUN sudo apt update
COPY . .
RUN npm install
RUN npm install -g @angular/cli@latest
EXPOSE 4200
CMD ng serve --host 0.0.0.0 --port 4200 --disableHostCheck true


