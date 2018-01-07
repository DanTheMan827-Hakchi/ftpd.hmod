GIT_COMMIT := $(shell echo "`git rev-parse --short HEAD``git diff-index --quiet HEAD -- || echo '-dirty'`")

all: out/ftpd-$(GIT_COMMIT).hmod

out/ftpd-$(GIT_COMMIT).hmod:
	mkdir -p out/
	chmod +x "mod/etc/init.d/S93ftpd"
	[ -f "out/ftpd-$(GIT_COMMIT).hmod" ] || tar -czvf "out/ftpd-$(GIT_COMMIT).hmod" -C mod/ etc

clean: clean-hmod

clean-hmod:
	-rm -rf "out/"

.PHONY: clean clean-hmod