PY=python
PANDOC=pandoc

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/_data
OUTPUTDIR=$(BASEDIR)/pdf
STYLEDIR=$(INPUTDIR)/pdf

help:
	@echo ' 																	  '
	@echo 'Makefile for the Markdown CV                                       '
	@echo '                                                                       '
	@echo 'Usage:                                                                 '
	@echo '   make pdf                         generate a PDF file  			  '
	@echo '                                                                       '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html'
	@echo ' 																	  '
	@echo 'pandoc test.md -o test.pdf --bibliography=test_ref.bib --csl=plos.csl  '
	@echo ' 																	  '
	@echo 'get templates from: https://github.com/jgm/pandoc-templates			  '

pdf:
	pandoc -s -f markdown-auto_identifiers \
	"$(INPUTDIR)"/*.yml \
	-o "$(OUTPUTDIR)/cv.pdf" \
	--template="$(STYLEDIR)/template.tex" \
	--pdf-engine=xelatex


.PHONY: help pdf 
