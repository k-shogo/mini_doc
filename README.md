# mini_doc

## Build on Dokcer

```
docker-compose build
```

## setup

```
docker-compose run rails db:create
docker-compose run rails db:migrate
docker-compose run rails db:seed_fu
docker-compose run rails rake assets:precompile
```

## run

```
docker-compose up
```
