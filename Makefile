SHELL := /bin/bash

any:
	@echo "This script is being called from ${PWD}."
	cat scripts/assets/setup.sh

# Create make.env file with MAKE_DIR=$SUBMODULE_DIR
# Move surrogate.Makefile to parent directory
init:
	echo "MAKE_DIR=$(notdir ${PWD})" > ../make.env
	cat surrogate.Makefile > ../Makefile

setup-monorepo:
	. ./scripts/monorepo/setup_monorepo.sh $(NAME)
	. ./scripts/monorepo/setup_pnpm.sh
	cd monorepo

assets:
	. ./scripts/assets/create.sh

astro:
	. ./scripts/astro/create.sh app $(NAME)

lib-frontend-fn:
	. ./scripts/lib-frontend-fn/create.sh $(NAME)

svelte-static-%:
	. ./scripts/svelte-kit/create.sh static $@ $(NAME)

svelte-node-%:
	. ./scripts/svelte-kit/create.sh node $@ $(NAME)
