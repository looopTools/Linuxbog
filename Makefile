all:	
	(cd friheden; make html)
	(cd admin; make html) 
	(cd program; make html)
	(cd web; make html) 
	(cd sikkerhed; make html) 
	echo "B�ger done" | mail pto-mobil

clean:
	(cd friheden; make clean)
	(cd admin; make clean) 
	(cd program; make clean)
	(cd web; make clean) 
	(cd sikkerhed; make clean) 
