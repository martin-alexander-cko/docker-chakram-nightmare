# docker-chakram-nightmare

The Docker image for running [Chakram](https://github.com/CKOTech/checkout-chakram) and [Nightmare](https://github.com/segmentio/nightmare) tests.

## Command line use

Given your current working directory is the root of your sources, the following command executes the Chakram tests.

```bash
docker run -e MOCHA_GREP=@regression -e ENV=QA --rm -it -v ${PWD}:/usr/src/app vladimiraleksandrovcko/docker-chakram-nightmare:9.11-slim-tc
```

Environment variable **ENV** defines the target environment to test (e.g. _QA_, _DEV_), while environment variable **MOCHA_GREP** specifies the test scope. 

A _mochawesome_ test report will be saved in the current directory as specified by `${PWD}`. The Docker image is configured to execute command `npm run test` upon running. 

To execute another command, e.g. `node test/mochaScript.js`, prepend it with command `xvfb-run` and pass it as follows:

```bash
docker run -e MOCHA_GREP=@regression -e ENV=QA --rm -it -v ${PWD}:/usr/src/app vladimiraleksandrovcko/docker-chakram-nightmare:9.11-slim-tc node xvfb-run test/mochaScript.js
```

Note the use of `xvfb-run` before the actual command: this is required for [Nightmare](https://github.com/segmentio/nightmare) tests.

## Image Details

The Docker image is based on `node:9.11-slim` (see [official Node.js repository](https://hub.docker.com/_/node/)) and upon build installs all the required Node.js Modules (as listed in [`package.json`](package.json)) along with shared dependencies for `electron` and `xvfb` ([X virtual framebuffer](https://en.wikipedia.org/wiki/Xvfb)) required for headless browser testing.

Current directory should not contain a folder `node_modules` as local modules may conflict with the modules in the Docker image, which is especially the case with module `electron` used by `Nightmare` tests.

Any references to local `node_modules` should also be avoided:

~~`var chakram = require('../../node_modules/chakram/lib/chakram.js')`~~
 `var chakram = require('chakram')`

