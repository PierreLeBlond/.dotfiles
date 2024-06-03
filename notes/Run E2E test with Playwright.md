## Just a contained playwright server

Since i'm on arch linux, rather than providing all dependencies to make the browsers work,
I followed https://github.com/microsoft/playwright/issues/26482, and it went well :

To run the playwright server,

```
sudo docker run --add-host host.docker.internal=host-gateway -p 3000:3000 \
--rm --init -it mcr.microsoft.com/playwright:v1.41.0-jammy \
/bin/sh -c "cd /home/pwuser && npx -y playwright@1.41.0 \
run-server --port 3000 --host 0.0.0.0"
```

With the `--add-host` option, I can access my local server from the docker host,
though I have to use `host.docker.internal` explicitly within my tests.
For now it's hard-coded, I should see if a global variable/config is better.

First, I need to make sure my local server is running,

```
pnpm run dev
```

It will probably use port `3001`, since docker is already being forwarded to port `3000`

Then, to run the playwright client,

```
PW_TEST_CONNECT_WS_ENDPOINT=ws://127.0.0.1:3000/ pnpm exec playwright test --ui-host=localhost
```

`--ui-host` option allows [ui mode in your local browser](https://playwright.dev/docs/test-ui-mode#docker--github-codespaces).

Now, one issue I face, is not able to intercept browser request with msw, for it is only working at the playwright server level.

To properly mock api calls from the browser, I can use [playwright-msw](https://github.com/valendres/playwright-msw/blob/main/packages/playwright-msw/README.md).

## Adding a contained database

Install [docker-compose](https://archlinux.org/packages/?name=docker-compose),

```
pacman -S docker-compose
```

create a `Dockerfile`,

```dockerfile
FROM postgres:16

RUN psql -U postgres -c "CREATE DATABASE recipes"
```

`compose.yaml` file,

```yaml
services:
  postgres:
    image: postgres:16
    ports:
      - "5432:5432"
    environment:
      POSTGRES_USER: docker
      POSTGRES_PASSWORD: docker
      POSTGRES_DB: recipes
    volumes:
      - ./data:/var/lib/postgresql/data
volumes:
  db:
```

and run.

```
docker compose up -d
```

The `-d` option run the containers in the background.

Check the container name with

```
docker ps
```

You should now be able to connect to the database.

```
docker exec -it db-postgres-1 psql -U docker -d recipes
```
## Now, what about continuous integration ?

