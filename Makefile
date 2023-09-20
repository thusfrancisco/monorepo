init:
	source setup_monorepo.sh monorepo
	cd monorepo

create-svelte-app:
	node scripts/svelte-kit/create.js $(APP_NAME) app

create-svelte-lib:
	node scripts/svelte-kit/create.js $(APP_NAME) lib
