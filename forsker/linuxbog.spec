
Url:		http://www.linuxbog.dk/
Group:		Books/Computer books
Copyright:	OpenContent License
Source:		%{name}-%{version}.html.tar.gz
BuildRoot:	%{_tmppath}/%{name}-%{version}-root
Prefix:		%{_prefix}

%description -l da
Bogen er en del af en serie der kan findes samlet p� http://www.linuxbog.dk/.
* Linux - Friheden til at v�lge - En god bog til at komme i gang med Linux.
* Linux - Friheden til at v�lge programmer - Om de programmer du kan f� til Linux.
* Linux - Friheden til systemadministration - Om at administre sin egen Linux-server
* Linux - Friheden til at programmere - Programmering p� Linux
* Linux - Friheden til at programmere i C - C-programmering
* Linux - Friheden til sikkerhed p� internettet - Sikkerhed omkring din Linux-boks
* Linux - Friheden til egen webserver - Web og databaser
* Linux - Friheden til at skrive i SGML/DocBook - Kom i gang med at skrive b�ger i SGML/DocBook
* Linux - Friheden til at bruge kontorprogrammer - Kontorfunktioner p� en Linux/KDE/Star Office-maskine.

%prep
%setup -q -n %{buildname}

%install
mkdir -p $RPM_BUILD_ROOT/usr/share/doc/linuxbog/%{buildname}
if [ -d ./%{buildname} ]; then
	(cd %{buildname}; cp -r * $RPM_BUILD_ROOT/usr/share/doc/linuxbog/%{buildname})
else
	(cp -r * $RPM_BUILD_ROOT/usr/share/doc/linuxbog/%{buildname})
fi

if [ -d ./eksempler ]; then
	mkdir -p $RPM_BUILD_ROOT/usr/share/doc/linuxbog/%{buildname}/eksempler
	(cd ./eksempler; cp -r * $RPM_BUILD_ROOT/usr/share/doc/linuxbog/%{buildname}/eksempler)
fi

%clean
rm -rf $RPM_BUILD_ROOT

%files
%attr(-,root,root) 
%{_prefix}/share/doc/*

%changelog
* Tue Apr 16 2002 Troels Liebe Bentsen <tlb@rapanden.dk>
- Rettede /usr/share/books til /usr/share/doc, hint fra Torkil Zachariassen <torkil\@flug.fo>. 

* Sat Apr 14 2001 Troels Liebe Bentsen <tlb@rapanden.dk>
- F�rste udgave.

