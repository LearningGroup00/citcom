# interest-free-loan

## To Run
`docker compose up` will start up the server.

For running any Rails command like `rails c` prepend the command with `docker compose run citcom`

Examples:
```
docker compose run citcom rails c
```
```
docker compose run citcom bin/rails db:migrate
```
```
docker compose run citcom bundle
```

## Debugging
- Put the command `debugger` at any desired breakpoint.
- Start the server by `docker compose up`
- Run `docker ps` to see all running container
- Find the container name for `citcom`
- attach to the container `docker attach <container-name>`
