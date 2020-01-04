# https://github.com/w3c/epubcheck/releases
EPUBCHECKJAR=$(HOME)/pkgs/epubcheck-4.2.2/epubcheck.jar

DOC=desosa2019

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

# Create the full book.
# To create single chapter use:
# $ make pdf CHAPTERS=chapters/scipy/
pdf:
	mkdir -p $(TARGET_DIR)
	pandoc \
	 --include-in-header=preamble.tex \
     --variable urlcolor=cyan \
	 --toc \
	 --top-level-division=chapter \
	 --number-sections \
	 --toc-depth=2 \
	 --output=$(PDF_OUT) \
	 index.md \
	 $(CHAPTERS_MD)

docker:
	# Within the docker container you can run your jekyll commands, including "jekyll build --watch"
	docker run --rm --volume="$(CURDIR):/srv/jekyll" -it jekyll/builder:3.8.4 bash

serve:
	cd _site && python -m SimpleHTTPServer 4000

