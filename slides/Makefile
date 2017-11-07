TARGET := $(patsubst %.md,%.pdf,$(wildcard *.md))

.PHONY: all clean

all: $(TARGET)

%.pdf : %.md
	pandoc -s --pdf-engine=lualatex --filter pandoc-citeproc --highlight-style tango --toc -t beamer $^ header.yaml -o $@

clean:
	rm -f $(TARGET)
