# musl-mimalloc

This repository hosts a patched version of the musl library that takes adventage of the mimalloc allocator.

musl-mimalloc allows us to compile the world's fastest and most performant binaries in the Linux space.

### 1. Clone the repository

```bash
$ git clone https://github.com/OneCoreOSS/musl-mimalloc
$ cd musl-mimalloc
```

### 2. Compile musl

```bash
$ ./configure --with-malloc=external
$ EXTRA_OBJ=$PWD/src/malloc/external/mimalloc.o make
```

Once completed, you should now have functional copy of musl-mimalloc in lib/libc.so.

You can now install musl on your host and use it for your own projects.

### Credits

[musl libc](https://musl.libc.org/)

[mimalloc](https://github.com/microsoft/mimalloc/)

[Chimera Linux](https://github.com/chimera-linux/cports/tree/master/main/musl/) - provided all of the patches to make this work !
