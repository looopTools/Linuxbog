# $Id$
all: Makefiler filer

release : cvs2html filer  mail

Makefiler:
	cp Makefile.subdir friheden/Makefile
	cp Makefile.subdir applikationer/Makefile
	cp Makefile.subdir admin/Makefile
	cp Makefile.subdir program/Makefile
	cp Makefile.subdir web/Makefile
	cp Makefile.subdir sikkerhed/Makefile
	cp Makefile.subdir c/Makefile
	cp Makefile.subdir docbook/Makefile

filer:  Makefiler
	make Makefiler
	make -C friheden
	make -C applikationer
	make -C admin
	make -C program
	make -C web
	make -C sikkerhed
	make -C c
	make -C docbook
	make -C alle 

statusfiler:  Makefiler
	make -C friheden statusfiler
	make -C applikationer  statusfiler
	make -C admin  statusfiler
	make -C program  statusfiler
	make -C web  statusfiler
	make -C sikkerhed  statusfiler
	make -C c  statusfiler
	make -C docbook  statusfiler
	make -C alle  statusfiler

version:  Makefiler
	make -C friheden gemversion
	make -C applikationer  gemversion
	make -C admin  gemversion
	make -C program  gemversion
	make -C web  gemversion
	make -C sikkerhed  gemversion
	make -C c  gemversion
	make -C docbook  gemversion

eksempelbackup:  statusfiler
	make -C friheden eksempelbackup
	make -C applikationer  eksempelbackup
	make -C admin  eksempelbackup
	make -C program  eksempelbackup
	make -C web  eksempelbackup
	make -C sikkerhed  eksempelbackup
	make -C c  eksempelbackup
	make -C docbook  eksempelbackup

clean: Makefiler
	make -C friheden clean
	make -C applikationer clean
	make -C admin clean 
	make -C program clean
	make -C web clean 
	make -C sikkerhed clean 
	make -C c clean 
	make -C docbook clean 
	make -C alle clean 
	rm -rf cvs2html
	rm -rf Friheden_palm.tgz 

cvs2html:
	chmod +x /home/pto/utils/cvs2html
	rm -rf cvs2html
	mkdir cvs2html
	/home/pto/utils/cvs2html  -l http://cvs.sslug.dk/linuxbog -f -p -o cvs2html/index.html -v -a -b -n 6 -C cvs_crono.html


mail:
	echo "Nu er der nye b�ger p� tyge. Have a nice day" | mail -s "automatisk mail: bog OK" linuxbog@sslug.dk
