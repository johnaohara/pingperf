#!/bin/sh
VERSION=$1
TAG=$2

echo "Building $VERSION"

cp pom.xml pom.xml.bak

sed -e "s!^\(\s*<quarkus\.version>\)[^;]*\(\s*<\/quarkus\.version>\)!\1$VERSION\2!" pom.xml.bak > pom.xml

mvn package -Pnative -Dnative-image.docker-build=true 

docker build -f Dockerfile.quarkus-native -t pingperf-quarkus-native-$TAG .


