#!/bin/sh -e

action=$1
gav=$2

groupId=$(echo $gav | cut -d ':' -f 1)
artifactId=$(echo $gav | cut -d ':' -f 2)
version=$(echo $gav | cut -d ':' -f 3)

group_dir=$(echo $groupId | tr '.' '/')
artifact_dir=$HOME/.m2/repository/${group_dir}/${artifactId}/${version}

case "$action" in
    show_pom)
        cat ${artifact_dir}/${artifactId}-${version}.pom
        ;;
    show_manifest)
        unzip -p ${artifact_dir}/${artifactId}-${version}.jar META-INF/MANIFEST.MF
        ;;
    list_jar)
        jar tf ${artifact_dir}/${artifactId}-${version}.jar
        ;;
    print_dir)
        echo ${artifact_dir}
        ;;
    *)
        echo "Usage: $0 show_pom|show_manifest|list_jar|print_dir groupId:artifactId:version"
        exit 1
    ;;
esac

