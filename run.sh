#!/bin/bash

ARCH=$1
TARGET=$2

useage()
{
	echo "[useage]: $0 <arch> <version>"
}

if [ ! $1 ]; then
	useage
	exit
fi


if [ $ARCH == "x86_64" ]; then
	if [ $TARGET == "2.6.34" ]; then
		echo "x86_64 2.6.34"
	elif [ $TARGET == "3.16" ]; then
		echo "x86_64 3.16"
	elif [ $TARGET == "4.4" ]; then
		echo "x86_64 4.4"
	elif [ $TARGET == "5.4" ]; then
		ln -sfn output_1_31 submodule/busybox/output
		./make_image.sh ext4
	elif [ $TARGET == "slub" ]; then
		ln -sfn output_1_14 submodule/busybox/output
		./make_image.sh ext2
	elif [ $TARGET == "master" ]; then
		echo "x86_64 master"
	else
		useage
		echo "Now support architecture : x86_64/arm64"
		echo "Now support version: 2.6.34/3.16/4.4/5.4/master"
		exit
	fi
elif [ $ARCH == "arm64" ]; then
	if [ $TARGET == "2.6.34" ]; then
		echo "The arm64 not support linux2.6.34 version"
	elif [ $TARGET == "3.16" ]; then
		echo "arm64 3.16"
	elif [ $TARGET == "4.4" ]; then
		echo "arm64 4.4"
	elif [ $TARGET == "5.4" ]; then
		echo "arm64 5.4"
	elif [ $TARGET == "master" ]; then
		echo "arm64 master"
	else
		useage
		echo "Now support architecture : x86_64/arm64"
		echo "Now support version      : 2.6.34/3.16/4.4/5.4/master"
		exit
	fi
fi



