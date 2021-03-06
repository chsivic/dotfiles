#!/bin/bash
case `pwd -P` in
*fbcode*)
  dir_list=(
    assistant/asr/
    assistant/proxy/
    buck-out/dev/gen/configerator/structs/shortwave/
    buck-out/dev/gen/dsi/logger/configs/{BenchieResultsLoggerConfig,*Speech*}/
    configerator/structs/shortwave/
    dsi/logger/configs/Short*
    dsi/logger/configs/{BenchieResultsLoggerConfig,*Speech*,*Shortwave*}/
    experimental/sichen/
    fblearner/flow/core/
    fblearner/flow/projects/langtech/*asr/
    fblearner/flow/projects/langtech/speech*/
    fblearner/flow/service/
    folly/
    langtech/
    language_technology/
    proxygen/
    servicerouter/
    shortwave/
    vue/
    mui/
    third-party-buck/gcc-5-glibc-2.23/build/aiohttp/lib/python/aiohttp/
    third-party-buck/gcc-5-glibc-2.23/build/kaldi/include/
    third-party-buck/gcc-5-glibc-2.23/build/openfst-kaldi/include/
    third-party2/boost/1.66.0/src/boost_1_66_0/boost
    ~/tp2/kaldi/master/src/kaldi-trunk/src/
    tupperware/config/common/
    tupperware/config/shortwave/
    tupperware/twdeploy/config/
    wangle/
    zeus/shardmgr/
    ~/kaldi/kaldi-trunk/src/
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
  dir_list=()
esac

dir_list=("${dir_list[@]}" $@)

echo "dir_list: ${dir_list[@]}"
find "${dir_list[@]}" -type f  -name "*.c" -o -name "*.cpp" -o -name "*.h" \
  -o -name "*.hh" -o -name "*.cc" -o -name '*.h.in' \
  -o -name "*.hpp" -o -name "*.tcc" \
  -o -name "*.py" -o -name "*.json" -o -name "*.sh" -o -name "*.pl" \
  -o -name "*.thrift" -o -name TARGETS \
  -o -name "*.cinc" -o -name "*.tw" \
  -o -name "*.mcconf" -o -name "*.cconf" \
  > cscope.files

echo "Generating ctags ..."
ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q -L cscope.files &
echo "Generating cscope ..."
cscope -bq &
