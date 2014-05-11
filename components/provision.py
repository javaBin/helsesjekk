#!/usr/bin/env python

import sys
import os.path
from json import loads
import os
from urllib2 import urlopen

log = "%(HOME)s/.provision/provision.log" % os.environ


if not os.path.exists(log):
    print "Could not find log at %s" % log
    sys.exit(1)

else:
    with open(log, 'r') as logfile:
        line = logfile.readline()

    date, tag, commit = line.strip().split(" ")
    print "Last provisioned: %s" % date
    print "Commit: %s" % commit

    data = loads(urlopen("https://api.github.com/repos/javaBin/infrastructure/commits/HEAD").read())
    remote_commit = data["sha"]

    if remote_commit != commit:
        print "Might not be up to date! (Latest on GitHub is %s)" % remote_commit
        sys.exit(1)
