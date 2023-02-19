#!/bin/bash

set -euxo pipefail

cd repo

find . -iname *.h -o -iname *.hpp -o -iname *.cpp \
	-exec clang-format --dry-run --Werror -style=file {} +

if grep -R -n -w -f .bad_words src include; then
	exit 1
fi

cd ..

build_run() {
	local B_DIR=$1
	shift
	mkdir $B_DIR
	cmake -Srepo -B$B_DIR "$@"
	cmake --build $B_DIR
	./$B_DIR/tests/runUnitTests
}

build_run build      -DUSE_CLANG_TIDY=TRUE
build_run build_ASAN -DCMAKE_BUILD_TYPE=ASAN
build_run build_USAN -DCMAKE_BUILD_TYPE=USAN
