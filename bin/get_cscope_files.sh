#!/bin/bash
if [ $# -eq 0 ]
then
  case `pwd -P` in 
  *fbcode*)
    dir_list=(
      buck-out/dev/gen/configerator/structs/shortwave/
      buck-out/dev/gen/dsi/logger/configs/{BenchieResultsLoggerConfig,*Speech*}/
      dsi/logger/configs/Short*
      dsi/logger/configs/{BenchieResultsLoggerConfig,*Speech*}/
      experimental/sichen/
      folly/
      langtech/
      language_technology/
      servicerouter/client/
      shortwave/
      third-party2/libsndfile/1.0.28/src/
      tupperware/config/common/
      tupperware/config/shortwave/
      wangle/
    )
    ;;
  *dataswarm*)
    dir_list=(
      tasks/aml/langtech/
    )
    ;;
  *configerator*)
    dir_list=(
      source/
    )
    ;;
  *)
    dir_list=$@
  esac
else
  dir_list=$@
fi

echo "dir_list: ${dir_list[@]}"
find ${dir_list[@]} -type f  -name "*.c" -o -name "*.cpp" -o -name "*.h" \
  -o -name "*.hh" -o -name "*.cc" -o -name '*.h.in' \
  -o -name "*.hpp" -o -name "*.tcc" \
  -o -name "*.py" -o -name "*.json" \
  -o -name "*.thrift" -o -name TARGETS \
  -o -name "*.cinc" -o -name "*.tw" \
  -o -name "*.mcconf" -o -name "*.cconf" \
  > cscope.files

echo "Generating ctags ..."
ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q -L cscope.files &
echo "Generating cscope ..."
cscope -bq &
