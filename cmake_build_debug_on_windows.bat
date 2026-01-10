@echo off

set project_base_dir=%~dp0

echo project_base_dir: %project_base_dir%

if not exist "%project_base_dir%\build" (
    mkdir "%project_base_dir%\build"
)

cd "%project_base_dir%\build"

cmake .. -G "Visual Studio 17 2022" -DCMAKE_BUILD_TYPE=Debug -DWITH_JDBC=ON -DWITH_SSL="%OPENSSL_ROOT_DIR%" -DCMAKE_INSTALL_PREFIX=%project_base_dir%/out -DINSTALL_LIB_DIR=%project_base_dir%/out/lib
cmake --build . --config Debug --target install -j8 -v
