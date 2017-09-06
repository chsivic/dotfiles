#!/bin/bash
if [ $# -eq 0 ]
then
dir_list=`pwd`
else
dir_list=$@
fi

echo "dir_list: ${dir_list[@]}"
find ${dir_list[@]} -type f  -name "*.c" -o -name "*.cpp" -o -name "*.h" -o -name "*.hpp" \
        -o -name "*.py" -o -name "*.json" \
        -o -name "*.thrift" -o -name TARGETS \
         > cscope.files

echo "Generating ctags ..."
ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q -L cscope.files &
echo "Generating cscope ..."
cscope -bq &
