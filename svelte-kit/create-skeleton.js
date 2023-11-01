import { create } from 'create-svelte';


const templateMap = {
  'app': 'skeleton',
  'lib': 'skeletonlib'
};
const template = templateMap[
  (process.argv[2]) ? process.argv[2] : (function(){throw "Not enough arguments."}())
];
const appName = process.argv[3];


await create(appName, {
  name: appName,
  template: template, // or 'skeleton' or 'skeletonlib'
  types: 'typescript', // or 'typescript' or null;
  prettier: true,
  eslint: true,
  playwright: true,
  vitest: true
});