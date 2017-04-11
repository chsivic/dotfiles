#!/router/bin/python

import os

dir = os.getcwd()
if os.path.isdir(dir + '/binos'):
    print dir + '/binos'
else:
    while '/' in dir and dir.rsplit('/', 1)[1] != 'binos' and \
                    dir.rsplit('/', 1)[1] != 'vob':
        dir = dir.rsplit('/', 1)[0]
    if 'binos' in dir:
        print dir
    else:
        print dir.rsplit('/', 1)[0] + '/binos'
