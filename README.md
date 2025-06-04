# interest-free-loan

## To Run
`docker compose up` will start up the server.

For running any Rails command like `rails c` prepend the command with `docker compose run citcom`

Examples:d
```
docker compose run citcom rails c
```
```
docker compose run citcom bin/rails db:migrate
```

{sudo docker compose run citcom bundle exec rails db:migrate
sudo docker compose run citcom bundle exec rails c}


```
docker compose run citcom bundle
```

## Debugging
- Put the command `debugger` at any desired breakpoint.
- Start the server by `docker compose up`
- Run `docker ps` to see all running container
- Find the container name for `citcom`
- attach to the container `docker attach <container-name>`


Date:03/06/2025
#User setup using Devise: 
-User info- (first_name,last_name,email,ward or village,post _office, upazila,zila and contuct_number.) 
-User type: anonymus citizen and admin.
-Complain_type: anonymus, citizens.
-And also add picture/pdf file on complain.