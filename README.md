# Grupo29
Repositorio principal para el desarrollo del proyecto

## Heroku
[Link to heroku app](guarded-island-96195.herokuapp.com)

## Instructions

### Database and Environment (ubuntu instructions)
* Create a file called `.env` with the following key value pairs, replacing it with the information about your local postgres database:
```sh
RAILS_ENV=development
DB_USERNAME=dbusername
DB_PASSWORD=dbpassword
DB_NAME=dbname
```

* Run `source .exportenv` in the console

* Now you can run `rails server` to run the app.
