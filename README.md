# myMLNomachine
Machine learning image including X and Nomachine for GUI access.

## Enviroment vaiables
USER -> user for the nomachine login
PASSWORD -> password for the nomachine login

## Usage

```
docker run -d -p 4000:4000 --name desktop -e PASSWORD=password \
-e USER=user --cap-add=SYS_PTRACE jirikulik/mymlnomachine
```

