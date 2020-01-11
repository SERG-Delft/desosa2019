# https://github.com/w3c/epubcheck/releases
EPUBCHECKJAR=$(HOME)/pkgs/epubcheck-4.2.2/epubcheck.jar

DOC=desosa2019

CHAPTERS=$(wildcard chapters/*)

CHAPTERS_MD=$(patsubst %,%/index.md,$(CHAPTERS))

RESOURCE_PATH=$(subst $(EVAL) $(EVAL),:,$(CHAPTERS)):./

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
	 --resource-path=$(RESOURCE_PATH) \
	 --output=$(EPUB_OUT) \
	 index.md \
	 $(CHAPTERS_MD)

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
#
# To create single chapter use:
#
# To create tex source for debugging, use:
# $ make pdf CHAPTERS=chapters/scipy/ PDF_OUT=target/desosa.tex
pdf:
	mkdir -p $(TARGET_DIR)
	pandoc \
	 --include-in-header=preamble.tex \
     --variable urlcolor=cyan \
	 --toc \
	 --top-level-division=chapter \
	 --number-sections \
	 --toc-depth=2 \
	 --resource-path=$(RESOURCE_PATH) \
	 --output=$(PDF_OUT) \
	 index.md \
	 $(CHAPTERS_MD)

docker:
	# Within the docker container you can run your jekyll commands, including "jekyll build --watch"
	docker run --rm --volume="$(CURDIR):/srv/jekyll" -it jekyll/builder:3.8.4 bash

serve:
	cd _site && python -m SimpleHTTPServer 4000

