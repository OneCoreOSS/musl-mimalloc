# musl-mimalloc

> [!NOTE]
> This branch is dedicated to compiling musl with Microsoft's mimalloc from original musl source files with patch files. If you wish to compile a pre-patched musl with mimalloc, then use the main branch instead.

### 1. Clone the repository

```bash
$ git clone https://github.com/OneCoreOSS/musl-mimalloc -b patches
$ cd musl-mimalloc
```

### 2. Choose your musl-mimalloc version

You will need to choose a version of musl to patch with a version of mimalloc.

We provide helper scripts to automate this task. For example, let's say we want to use musl 1.2.5 with mimalloc 2.2.3, we'll run:

```bash
$ sh musl-1.2.5-mimalloc-2.2.3.sh
### Downloading and Patching ###
```

Once completed, you should have a patched musl with mimalloc in "src/musl-{version}".

### 3. Compile musl

Here, we assume musl 1.2.5 with mimalloc 2.2.3. The procedure should be the same for other versions.

```bash
$ cd src/musl-1.2.5
$ ./configure --with-malloc=external
$ EXTRA_OBJ=$PWD/src/malloc/external/mimalloc.o make
```

Once completed, you should now have functional copy of musl-mimalloc in lib/libc.so.

You can now install musl on your host and use it for your own projects.

### Credits

[musl libc](https://musl.libc.org/)

[mimalloc](https://github.com/microsoft/mimalloc/)

[Chimera Linux](https://github.com/chimera-linux/cports/tree/master/main/musl/) - provided all of the patches to make this work !
