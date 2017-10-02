#!/bin/bash
if [ $# -eq 0 ]
then
dir_list=(
    servicerouter/client/
    shortwave/
    dsi/logger/configs/SpeechRecognitionServiceLoggerConfig/
    tupperware/config/shortwave/
    language_technology/
)
else
dir_list=$@
fi

echo "dir_list: ${dir_list[@]}"
find ${dir_list[@]} -type f  -name "*.c" -o -name "*.cpp" -o -name "*.h" \
    -o -name "*.hpp" -o -name "*.tcc" \
    -o -name "*.py" -o -name "*.json" \
    -o -name "*.thrift" -o -name TARGETS \
    -o -name "*.cinc" -o -name "*.tw" \
    > cscope.files

echo "Generating ctags ..."
ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q -L cscope.files &
echo "Generating cscope ..."
cscope -bq &
