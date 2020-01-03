# https://github.com/IDPF/epubcheck/releases/tag/v3.0.1
EPUBCHECKJAR=$(HOME)/pkgs/epubcheck-3.0.1/epubcheck-3.0.1.jar

DOC=desosa2015

CHAPTERS=$(wildcard chapters/*)

CHAPTERS_MD=$(patsubst %,%/index.md,$(CHAPTERS))

EXTRACTDIR=zzz-epub-extract
TARGET_DIR=target

EPUB_OUT=$(TARGET_DIR)/$(DOC).epub
PDF_OUT=$(TARGET_DIR)/$(DOC).pdf

all:
	$(MAKE) clean img epub 

epub:
	mkdir -p $(TARGET_DIR)
	pandoc \
	 --toc \
	 --number-sections \
	 --toc-depth=2 \
	 --epub-cover-image=img/cover.jpg \
	 --output=$(EPUB_OUT) \
	 index.md \
	 $(CHAPTERS_MD)

allimg:
	mkdir -p images
	$(foreach chapter, $(CHAPTERS), cp -r -i $(chapter)/images/* images/;)

check:
	java -jar $(EPUBCHECKJAR) $(EPUB_OUT)

# An epub file is just a zip file with html content.
# Provide target for unzipping to help fixing incorrect epubs.
unzip:
	rm -rf $(EXTRACTDIR)
	mkdir -p $(EXTRACTDIR)
	cp $(EPUB_OUT) $(EXTRACTDIR)/$(DOC).zip
	cd $(EXTRACTDIR); unzip $(DOC).zip

clean:
	rm -rf images $(EXTRACTDIR) $(TARGET_DIR)

pdf:
	mkdir -p $(TARGET_DIR)
	pandoc \
	 --include-in-header=preamble.tex \
	 --smart \
	 --toc \
	 --chapters \
	 --number-sections \
	 --toc-depth=2 \
	 --output=$(PDF_OUT) \
	 index.md \
	 $(CHAPTERS_MD)

docker:
	docker run --rm --volume="$(CURDIR):/srv/jekyll" -it jekyll/builder:3.8.4 bash

serve:
	cd _site && python -m SimpleHTTPServer 4000

