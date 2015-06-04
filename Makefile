xml2rfc = "/projects/xml2rfc/xml2rfc.tcl"

stylesheet = lib/rfc2629.xslt
reduction  = lib/clean-for-DTD.xslt

TARGETS = draft-reschke-http-oob-encoding-latest.html \
          draft-reschke-http-oob-encoding-latest.redxml \
          draft-reschke-http-oob-encoding-latest.unpg.txt \
          draft-reschke-http-oob-encoding-latest.txt

all: $(TARGETS)

clean:
	rm -f $(TARGETS)

%.html: %.xml $(stylesheet)
	xsltproc $(stylesheet) $< > $@

%.redxml: %.xml $(reduction)
	xsltproc $(reduction) $< > $@

%.txt: %.redxml
	$(xml2rfc) $< $@

%.unpg.txt: %.redxml
	$(xml2rfc) $< $@.unpg
	mv $@.unpg $@
