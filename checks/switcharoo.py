#!/usr/bin/env python

import sys
from json import loads
import requests

try:
    r = requests.get("http://localhost:1338/status")
    if r.status_code >= 400:
        print "Status code %s" % r.status_code
        sys.exit(1)

    data = r.json()
    print "Everything fine."
except:
    print "Unable to connect"
    sys.exit(1)
