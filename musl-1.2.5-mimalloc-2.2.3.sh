#!/bin/sh

MUSL_VER="1.2.5"
MIMALLOC_VER="2.2.3"

echo ":: Downloading musl $MUSL_VER"
curl -LOk "https://musl.libc.org/releases/musl-$MUSL_VER.tar.gz"
if [ $? -ne 0 ]; then
	echo "!! Failed to download musl $MUSL_VER"
	exit 1
fi

echo ":: Downloading mimalloc $MIMALLOC_VER"
curl -LOk "https://github.com/microsoft/mimalloc/archive/refs/tags/v$MIMALLOC_VER.tar.gz"
if [ $? -ne 0 ]; then
	echo "!! Failed to download mimalloc $MIMALLOC_VER"
	exit 1
fi

echo ":: Extracting musl-$MUSL_VER.tar.gz"
tar -xf "musl-$MUSL_VER.tar.gz"
if [ $? -ne 0 ]; then
	echo "!! Failed to extract musl $MUSL_VER"
	exit 1
fi

echo ":: Moving musl-$MUSL_VER to src/musl-$MUSL_VER"
mv "musl-$MUSL_VER" "src/musl-$MUSL_VER"
if [ $? -ne 0 ]; then
	echo "!! Failed to move musl $MUSL_VER to src/musl"
	exit 1
fi

echo ":: Extracting v$MIMALLOC_VER.tar.gz"
tar -xf "v$MIMALLOC_VER.tar.gz"
if [ $? -ne 0 ]; then
	echo "!! Failed to extract mimalloc $MIMALLOC_VER"
	exit 1
fi

echo ":: Moving mimalloc-$MIMALLOC_VER to src/musl-$MUSL_VER/mimalloc"
mv "mimalloc-$MIMALLOC_VER" "src/musl-$MUSL_VER/mimalloc"
if [ $? -ne 0 ]; then
	echo "!! Failed to move mimalloc $MIMALLOC_VER to src/musl-$MUSL_VER/mimalloc"
	exit 1
fi

echo ":: Patching musl with patches/musl-$MUSL_VER-mimalloc-$MIMALLOC_VER.patch"
ORIGINDIR="$PWD"
cd "src/musl-$MUSL_VER"
patch -p1 < "../../patches/musl-$MUSL_VER-mimalloc-$MIMALLOC_VER.patch"
if [ $? -ne 0 ]; then
	echo "!! Failed to patch musl"
	exit 1
fi
cd "$ORIGINDIR"

echo ":: Cleaning up tarballs"
rm -f "musl-$MUSL_VER.tar.gz"
rm -f "v$MIMALLOC_VER.tar.gz"

echo ":: Done !"
