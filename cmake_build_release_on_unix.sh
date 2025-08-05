#!/bin/bash

project_base_dir=$(cd $(dirname $0);pwd)

echo "project_base_dir: $project_base_dir"

if [ ! -d "$project_base_dir/build" ]; then
    mkdir "$project_base_dir/build"
fi

cd "$project_base_dir/build" || exit

cmake .. -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DWITH_JDBC=ON -DCMAKE_INSTALL_PREFIX=$project_base_dir/out -DINSTALL_LIB_DIR=$project_base_dir/out/lib
cmake --build . --config Release --target install -j8 -v