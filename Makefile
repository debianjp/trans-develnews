SRC_FILES  = $(wildcard en/*.txt)
PO_SRC = $(shell find en -name '*.txt' -print0 | xargs -r -n1 -0 echo -m)
#PO_FILES   = $(SRC_FILES:en/%.txt=po/ja/%.po)
MDWN_FILES = $(SRC_FILES:en/%.txt=ja/%.mdwn)

all: $(MDWN_FILES)

ja/%.mdwn: po/ja.po
	po4a-translate -f text -o markdown -m en/$(notdir $(basename $@)).txt -M UTF-8 -p po/ja.po -l $@

po/ja.po: $(SRC_FILES)
	po4a-updatepo -M UTF-8 -f text -o markdown $(PO_SRC) -p po/ja.po

