all: clean statusfiler html palmpilot pspdf cvs2html mail

statusfiler:
	make -C friheden statusfiler
	make -C admin statusfiler 
	make -C program statusfiler
	make -C web statusfiler 
	make -C sikkerhed statusfiler 

sgml:
	make -C friheden sgml
	make -C admin sgml 
	make -C program sgml
	make -C web sgml 
	make -C sikkerhed sgml 

html:
	make -C friheden html
	make -C admin html 
	make -C program html
	make -C web html 
	make -C sikkerhed html 

palmpilot:
	make -C friheden palmpilot
	make -C admin palmpilot 
	make -C program palmpilot
	make -C web palmpilot 
	make -C sikkerhed palmpilot 
	       
	       
pspdf:	       
	make -C friheden pspdf
	make -C admin pspdf 
	make -C program pspdf
	make -C web pspdf 
	make -C sikkerhed pspdf 
	       
	       
clean:	       
	make -C friheden clean
	make -C admin clean 
	make -C program clean
	make -C web clean 
	make -C sikkerhed clean 
	rm -rf cvs2html

cvs2html:
	chmod +x /home/pto/utils/cvs2html
	rm -rf /home/www/www.sslug.dk/bog/cvs2html
	mkdir /home/www/www.sslug.dk/bog/cvs2html
	/home/pto/utils/cvs2html  -l http://www.sslug.dk/bog -f -p -o /home/www/www.sslug.dk/bog/cvs2html/index.html -v -a -b -n 6 -C cvs_crono.html


mail:
	echo "Done b�ger" | mail pto-mobil
