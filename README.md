wcarm64
=======

_A port of [wcx64](https://github.com/eliben/wcx64) to AArch64._

Forked from the Apple Silicon version by [enoneo](https://github.com/neoeno/wcarm64)

**wcarm64** is a simplistic `wc` clone in ARM64/AArch64 assembly. Usage:

```bash
    $ wcarm64 /tmp/1 /tmp/2 /usr/share/dict/words
              0          1          2    /tmp/1
              2          5         23    /tmp/2
          99171      99171     938848    /usr/share/dict/words
          99173      99177     938873    total
```

When not given any command-line arguments, reads from stdin:

```bash
    $ wcarm64 < /tmp/2
              2          5         23
```

Always prints the all three counters: line, word, byte.

### Setting up the enviroment using Docker
To compile and run the wcarm64 on an AArch64 platform, you can use Docker.

#### Steps
1. Pull and run the Docker image with a shared volume to the content of this repo.

```bash
    $ docker run --rm -it -v $(pwd):/workspace --platform linux/arm64 ubuntu
```

2. Inside the Docker container, install the necessary tools.

```bash
    $ apt update
    $ apt install -y build-essential cmake gdb
```
gdb is optional.

3. You can now compile and run wcarm64 inside the container.

```bash
    $ make
    as  wcarm64.s -o wcarm64.o
    ld  -o wcarm64 wcarm64.o
    $ ./wcarm64 /tmp/1
```
