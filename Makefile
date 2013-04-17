SRC_FILES  = $(wildcard en/*.txt)
#PO_FILES   = $(SRC_FILES:en/%.txt=po/ja/%.po)
MDWN_FILES = $(SRC_FILES:en/%.txt=ja/%.mdwn)

all: $(MDWN_FILES)

ja/%.mdwn: po/ja.po
	po4a-translate -f text -o markdown -m en/$(notdir $(basename $@)).txt -M UTF-8 -p po/ja.po -l $@

po/ja.po: master.txt
	po4a-updatepo -M UTF-8 -f text -o markdown -m master.txt -p po/ja.po

master.txt: $(SRC_FILES)
	cat en/*.txt > master.txt

#.PRECIOUS: po/ja/%.po
