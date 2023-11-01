SHELL := /bin/bash

any:
	@echo "This script is being called from ${PWD}."
	cat ./assets/setup.sh

# Create make.env file with MAKE_DIR=$SUBMODULE_DIR
# Move surrogate.Makefile to parent directory
init:
	echo "MAKE_DIR=$(notdir ${PWD})" > ../make.env
	cat surrogate.Makefile > ../Makefile

setup-monorepo:
	. ./monorepo/setup_monorepo.sh $(NAME)
	. ./monorepo/setup_pnpm.sh
	cd monorepo

assets:
	. ./assets/create.sh

astro:
	. ./astro/create.sh app $(NAME)

lib-frontend-fn:
	. ./lib-frontend-fn/create.sh $(NAME)

svelte-static-%:
	. ./svelte-kit/create.sh static $@ $(NAME)

svelte-node-%:
	. ./svelte-kit/create.sh node $@ $(NAME)
