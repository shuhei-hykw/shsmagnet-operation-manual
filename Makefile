tex = main
pdf = $(tex).pdf

all: $(pdf)
	open $(pdf)

$(pdf): $(tex).tex
	@gecho "\\newcommand{\\version}{`git rev-parse --short HEAD`}" > version.tex
	xelatex -interaction=nonstopmode $(tex).tex
	xelatex -interaction=nonstopmode $(tex).tex

clean:
	rm -f $(tex).aux $(tex).log $(tex).out $(tex).toc $(pdf)
