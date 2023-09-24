SHELL := /bin/bash

init:
	source setup_monorepo.sh monorepo
	cd monorepo

create-svelte-app:
	. ./scripts/create-svelte-kit/create-static.sh app $(APP_NAME)

create-svelte-lib:
	. ./scripts/create-svelte-kit/create-static.sh lib $(APP_NAME)
