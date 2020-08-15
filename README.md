### Summary
Gerrit container supporting volume for gerrit home (it is like gerrit installed using apt).
Easy start.
Configuration and backup using volume.
Should work on kubernetes.
Totally unofficial container.

Ports in container:
- 29418
- 8080

Volume in container:
- /var/gerrit

Volume is home directory of gerrit. If volume on host is empty, it will be filled with default installation. Otherwise, gerrit in container will try to use the existing content.

### Build as 'latest' tagged
```
docker build . -t atudomain/gerrit:latest
```

### Start on random host ports with home dir volume '/opt/gerrit'
```
docker run -d -P -v /opt/gerrit:/var/gerrit atudomain/gerrit:latest
```

### The same ports on host and exposed in container
```
docker run -d -p 29418:29418 -p 8080:8080 -v /opt/gerrit:/var/gerrit atudomain/gerrit:latest
```
