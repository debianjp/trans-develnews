MDWN_FILES = $(wildcard *.mdwn)
BLOSXOM_FILES = $(MDWN_FILES:%.mdwn=%.d)

all: $(BLOSXOM_FILES)

%.d: %.html html2d.xsl Makefile
	xsltproc --nodtdattr --nonet html2d.xsl $< > $@

%.html: %.mdwn Makefile
	echo "<div class='markdown'>" > $@
	markdown $< >> $@
	echo "</div>" >> $@

clean:
	rm -f *.html *.d
