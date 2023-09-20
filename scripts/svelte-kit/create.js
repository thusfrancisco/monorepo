import { create } from 'create-svelte';


const appName = process.argv[2];
const templateMap = {
  'app': 'skeleton',
  'lib': 'skeletonlib'
};
const template = templateMap[
  (process.argv[3]) ? process.argv[3] : (function(){throw "Not enough arguments."}())
];


await create(appName, {
  name: appName,
  template: template, // or 'skeleton' or 'skeletonlib'
  types: 'typescript', // or 'typescript' or null;
  prettier: true,
  eslint: true,
  playwright: true,
  vitest: true
});