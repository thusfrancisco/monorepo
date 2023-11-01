import { defineConfig } from 'astro/config';
import svelte from '@astrojs/svelte';
import nodejs from '@astrojs/node';

// https://astro.build/config
export default defineConfig({
	// Enable Svelte to support Svelte components.
	integrations: [svelte()],
	publicDir: 'public',
	output: 'server',
  adapter: nodejs({
		mode: 'standalone',
	}),
});
