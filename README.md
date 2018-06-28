# Docker image for citeproc-node

## Usage

To create the docker image execute the following commands:

```bash
$ git clone --recursive https://github.com/LibreCat/citeproc-node
$ cd citeproc-node
$ docker build -t myciteproc .
```

To start the docker image execute the following command:

```bash
$ docker run -d -p 8085:8085 -t myciteproc
```