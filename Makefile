%.html: %.mdwn
	markdown $< > $@

clean:
	rm -f *.html
