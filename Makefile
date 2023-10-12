SHELL := /bin/bash

init:
	source setup_monorepo.sh monorepo
	cd monorepo

astro:
	. ./scripts/astro/create.sh app $(APP_NAME)

svelte-static-app:
	. ./scripts/svelte-kit/create.sh static app $(APP_NAME)

svelte-static-lib:
	. ./scripts/svelte-kit/create.sh static lib $(APP_NAME)

svelte-node-app:
	. ./scripts/svelte-kit/create.sh node app $(APP_NAME)

svelte-node-lib:
	. ./scripts/svelte-kit/create.sh node lib $(APP_NAME)
