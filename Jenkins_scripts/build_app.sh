cd front-end
ng build --prod --base-href=/petclinic/ --deploy-url=/petclinic/
compodoc -p src/tsconfig.app.json -d docs
