#!/bin/bash -e
if [ $# -ne 2 ]; then
    echo "Usage: $0 groupId artifactId"
    exit 1
fi

groupId=$1
artifactId=$2

url="https://repo1.maven.org/maven2"
url="${url}/${groupId//\./\/}"
url="${url}/${artifactId}"
url="${url}/maven-metadata.xml"

curl --silent $url | xpath -q -e '/metadata/versioning/latest/text()'
