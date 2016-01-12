from subprocess import call
from lib.utils import camelCaseArg
import sys



call(["lettuce", "features/" + camelCaseArg(sys.argv[-3]) + ".feature", '-v 4', sys.argv[-2], sys.argv[-1]])
