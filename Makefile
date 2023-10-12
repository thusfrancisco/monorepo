SHELL := /bin/bash

init:
	. ./scripts/monorepo/setup_monorepo.sh $(NAME)
	. ./scripts/monorepo/setup_pnpm.sh
	cd monorepo

assets:
	. ./scripts/assets/setup.sh

astro:
	. ./scripts/astro/create.sh app $(NAME)

lib-frontend-fn:
	. ./scripts/lib-frontend-fn/create.sh $(NAME)

svelte-static-app:
	. ./scripts/svelte-kit/create.sh static app $(NAME)

svelte-static-lib:
	. ./scripts/svelte-kit/create.sh static lib $(NAME)

svelte-node-app:
	. ./scripts/svelte-kit/create.sh node app $(NAME)

svelte-node-lib:
	. ./scripts/svelte-kit/create.sh node lib $(NAME)
