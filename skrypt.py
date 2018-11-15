from urllib.request import urlretrieve as download
download("http://kt.agh.edu.pl/~kamisinski/teaching/mpsis/lab/L1/content/clp_1.16_gmpl_ubuntu_16.04.tar.bz2", "clp.tar.bz2")
from subprocess import call
call(['cp','./clp.tar.bz2','/'])
call(['cd', '/'], shell=True)
call(['tar','-xjvpf','clp.tar.bz2'])
call(['export','LD_LIBRARY_PATH=/usr/local/lib'], shell=True)
