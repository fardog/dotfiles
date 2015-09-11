for D in `ls -d */`; do cd ${D}; git checkout master && git pull; cd ..; done
