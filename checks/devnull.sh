#!/usr/bin/env python

import sys
from json import loads
import requests

try:
#    env_host = "http://localhost:9001/"
    envHost = "http://test.javazone.no/"
    appInfo = envHost + "devnull/server/app-info"
    r = requests.get(appInfo)
    if r.status_code >= 400:
        print "Status code %s" % r.status_code
        sys.exit(1)

    data = r.json()
    print "Version: %(version)s" % data
    print "Commit: %(sha)s" % data
    print "Build time: %(buildTime)s" % data
except:
    print "Unable to connect"
    sys.exit(1)
