rootpath=$$(ls -d */)
all: clean install
install: check
	for folder in $(rootpath); do\
		stow -v --no-folding $$folder;\
	done
clean: check
	for folder in $(rootpath); do\
	    stow -v -D $$folder;\
	done
check:
	if [[ -z $$(which stow) ]]; then\
		exit 1;\
	fi
