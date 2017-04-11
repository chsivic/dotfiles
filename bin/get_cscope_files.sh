#!/bin/bash

binos_dir_list=(
#               binos/fman/fp/ 
#               binos/fman/fp/doppler/
#               binos/fman/fp/ngwc
#               binos/fman/fp/src
#               binos/fman/rp/ 
#               binos/infra/aobjman/
#               binos/infra/btrace 
#               binos/infra/btrace/include/
#               binos/infra/cdlpd/common/fed/src/ 
#               binos/infra/cdlpd/ngwc/ 
#               binos/infra/fman_lib/include/ 
#               binos/infra/ptl/src/ 
#               binos/infra/tdl/_gen_tdl_noarch/ 
#               binos/infra/tdl/_gen_tdl_noarch/access* 
#               binos/infra/tdl/_gen_tdl_noarch/doppler* 
#               binos/infra/tdl/_gen_tdl_noarch/fed_* 
#               binos/infra/tdl/_gen_tdl_noarch/fman* 
#               binos/infra/tdl/_gen_tdl_noarch/l2fib* 
#               binos/infra/tdl/_gen_tdl_noarch/matm_config
#               binos/infra/tdl/_gen_tdl_noarch/ngwc_* 
#               binos/infra/tdl/_gen_tdl_noarch/ngwc_fed_ui_matm
#               binos/infra/tdl/_gen_tdl_noarch/vxlan*
#               binos/infra/tdl/_gen_tdl_noarch/wl_* 
#               binos/infra/tdl/_gen_tdl_noarch/wlclient_* 
#               binos/infra/tdl/src/ 
#               binos/infra/tdl/src/doppler/ 
#               binos/infra/tdl/src/ngwc/ 
                binos/platforms/ngwc/common/
                binos/platforms/ngwc/doppler_sdk/ 
#               binos/platforms/ngwc/doppler_sdk/aal/ 
#               binos/platforms/ngwc/doppler_sdk/afdN/ 
#               binos/platforms/ngwc/doppler_sdk/ralN/ 
#               binos/platforms/ngwc/doppler_sdk/rm/ 
#               binos/platforms/ngwc/doppler_sdk/rmN/ 
#               binos/platforms/ngwc/doppler_sdk/spectra/
#               binos/platforms/ngwc/doppler_sdk/utils/ 
                binos/platforms/ngwc/fed 
#               binos/platforms/ngwc/fed/feature/ 
#               binos/platforms/ngwc/fed/fed_swig/ 
#               binos/platforms/ngwc/fed/ifmgr/ 
#               binos/platforms/ngwc/ng3k/fed/ 
#               binos/platforms/ngwc/ng3k/fed/feature/wireless/ 
               )
ios_dir_list=(
#             vob/cisco.comp/system-infra/util/ 
#             vob/ios/sys/if
#             vob/ios/sys/ip/
#             vob/ios/sys/l2fib/
#             vob/ios/sys/mcp/mcprp/
#             vob/ios/sys/mcp/mcprp/fman-rp/
#             vob/ios/sys/mcp/mcprp-ngwc/fman-rp
#             vob/ios/sys/mlrib/
#             vob/ios/sys/nve/
#             vob/ios/sys/switch/access_tunnel/ 
#             vob/ios/sys/switch/l2lisp/ 
#             vob/ios/sys/switch/mac_table/ 
#             vob/ss.comp1/cfc_cefmpls/tun/
#             vob/ss.comp1/lisp/
#             vob/ss.comp1/network-infra/
             );
if [ $# -eq 0 ]
then
dir_list=(${binos_dir_list[@]} ${ios_dir_list[@]})
else
dir_list=$@
fi

echo "dir_list: ${dir_list[@]}"
find ${dir_list[@]} -type f \( -name "*.c" -o -name *.cpp -o -name *.h \
        -o -name *.it -o -name *.lua \
        -o -name *.cdl -o -name *.ptl -o -name *.tdl -o -name *.tpp \) \
        -o -name *.py -o -name *.json \
        -o -name *.cs -o -name *.i \
         > cscope.files
#        -a ! -name "*paq*" \

echo "Generating ctags ..."
ctags -R --c++-kinds=+pl --fields=+iaS --extra=+q -L cscope.files &
echo "Generating cscope ..."
cscope-64 -bq &
