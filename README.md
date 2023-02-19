# docker-local-tests

## Сборка

```
docker build -t IMAGE_NAME .
```

## Запуск тестов
```
docker run --rm -v FULL_PATH_TO_REPO:/home/user/repo IMAGE_NAME
```

## Пример
```
docker build -t cpp-test .
docker run --rm -v /home/user/calc-fold:/home/user/repo cpp-test
```
