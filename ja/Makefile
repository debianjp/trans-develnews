MDWN_FILES = $(wildcard *.mdwn)
BLOSXOM_FILES = $(MDWN_FILES:%.mdwn=%.d)

all: $(BLOSXOM_FILES)

%.d: %.html html2d.xsl Makefile
	xsltproc --nodtdattr --nonet html2d.xsl $< > $@

%.html: %.mdwn Makefile
	echo "<div class='markdown'>" > $@
	markdown $< >> $@
	echo "</div>" >> $@

preview: $(BLOSXOM_FILES)
	cat $(BLOSXOM_FILES) | w3m -I e -T text/html

publish: $(BLOSXOM_FILES)
	svn checkout https://svn.debian.or.jp/repos/www/trunk/blosxom/data/develop develop
	cp -a $(BLOSXOM_FILES) develop
	svn add develop/develnews-*.d
	svn commit develop/develnews-*.d

clean:
	rm -f *.html *.d
	rm -rf develop
