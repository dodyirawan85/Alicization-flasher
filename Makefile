NAME ?= Alicization

VERSION ?= 1.0

DATE := $(shell date +'%Y%m%d-%H%M')

DEVICE := Rendang

ZIP := $(NAME)-$(DEVICE)-$(VERSION)-$(DATE).zip

EXCLUDE := Makefile README.md *.git* "$(NAME)-"*.zip* *.zip

all: $(ZIP)

$(ZIP):
	@echo "Creating ZIP: $(ZIP)"
	@zip -r9 "$@" . -x $(EXCLUDE)
	@echo "Generating SHA1..."
	@sha1sum "$@" > "$@.sha1"
	@cat "$@.sha1"
	@echo "Done."

clean:
	@rm -vf "$(NAME)-"*.zip*
	@echo "Done."
