fmt:
	shfmt -w  *.sh
	shfmt -w  apk/*.sh

lint:
	shfmt -d  *.sh
	shfmt -d  apk/*.sh
	shellcheck *.sh
	shellcheck apk/*.sh
	shellcheck --exclude=SC2148,SC2035 makefile

test: lint
