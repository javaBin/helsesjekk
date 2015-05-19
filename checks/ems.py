#!/usr/bin/env python

import sys
from json import loads
import requests

try:
    r = requests.get("http://localhost:9001/ems/server/app-info")
    if r.status_code >= 400:
        print "Status code %s" % r.status_code
        sys.exit(1)

    data = r.json()['build-info']
    print "Version: %(version)s" % data
    print "Commit: %(sha)s" % data
except:
    print "Unable to connect"
    sys.exit(1)
