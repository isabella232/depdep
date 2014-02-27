#!/usr/bin/python

try:
        import sys
        from lib.controller import Controller
        from lib.core.common import *
except ImportError,e:
        import sys
        sys.stdout.write("%s\n" %e)
        sys.exit(1)


##
### Main ...
##

if __name__ == "__main__":

	try:
       		controller = Controller()
       		controller.run()
	except Exception, err_mess:
		print err_mess
		sys.exit(1)
 
