import adapter from '@sveltejs/adapter-node';
import { vitePreprocess } from '@sveltejs/kit/vite';

//console.log(`ASSETS_URL=${process.env.ASSETS_URL}`);

/** @type {import('@sveltejs/kit').Config} */
const config = {
	// Consult https://kit.svelte.dev/docs/integrations#preprocessors
	// for more information about preprocessors
	preprocess: vitePreprocess(),

	kit: {
		// adapter-auto only supports some environments, see https://kit.svelte.dev/docs/adapter-auto for a list.
		// If your environment is not supported or you settled on a specific environment, switch out the adapter.
		// See https://kit.svelte.dev/docs/adapters for more information about adapters.
		adapter: adapter({
			// default options are shown. On some platforms
			// these options are set automatically — see below
			pages: 'build',
			assets: 'build',
			fallback: undefined,
			precompress: false,
			strict: true
		}),
		paths: {
			assets: process.env.ASSETS_URL ? process.env.ASSETS_URL : '',
		},
        files: {
			// If no CDN URL is set, get whatever package's assets.
            assets: process.env.ASSETS_URL ? process.env.ASSETS_URL : "./node_modules/assets",
        },
	}
};

export default config;
