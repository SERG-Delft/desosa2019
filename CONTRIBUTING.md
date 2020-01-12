To add your chapter please offer a pull request with it.

If your chapter describes SystemX, please proceed as follows:

- Create a folder `chapters/systemx`
- Put your chapter in file called `index.md`
- Ensure your `index.md` file starts with the proper meta-data:
```
---
layout: default
project: systemx
title: SystemX
chapter: true
---
```
- Put all images in a nested folder `images/systemx`. Make sure _all_ images are there. To create self-contained epub, hyperlinks to images on the web don't work.
- Add a chapter title at top level `#`, have sections start with `##`, and so on. You can have only _one_ top level `#` header.
- Ensure there is a blank line _before_ and after every (sub)section, as well as before and after every itemize.
- Do _not_ use raw html, but use markdown instead. In particular, do not use html `<table>`s, but use markdown's table syntax instead.
- Ensure `pandoc` is able to produce proper `pdf` and `epub` from your index file


If you want to try out building the full book and see your chapter in html, consult the Makefile