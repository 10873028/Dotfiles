STOW=$$(which stow 2> /dev/null)
STOWFOLDER=$$(ls -d */)
all: clean install
install: check
	for FOLDER in $(STOWFOLDER); do\
		$(STOW) -v --no-folding $$FOLDER;\
	done
clean: check
	for FOLDER in $(STOWFOLDER); do\
	    $(STOW) -v -D $$FOLDER;\
	done
check:
	if [[ -z $(STOW) ]]; then\
		exit 1;\
	fi
