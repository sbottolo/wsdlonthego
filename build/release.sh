#!/bin/bash

VERSION=${VERSION:-`git describe --tags`}

for OS in linux freebsd windows darwin
do
	GOOS=$OS GOARCH=amd64 go build -ldflags "-w -X main.version=${VERSION}"
	TARBALL=wsdlonthego-$VERSION-$OS-amd64.tar.gz
	if [ "$OS" = "windows" ]; then
		tar czf $TARBALL wsdlonthego.exe
	else
		tar czf $TARBALL wsdlonthego
	fi
	rm -f wsdlonthego wsdlonthego.exe
done
