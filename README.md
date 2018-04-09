# docker-chakram-nightmare

The Docker image for running [Chakram](https://github.com/CKOTech/checkout-chakram) and [Nightmare](https://github.com/segmentio/nightmare) tests.

## Command line use

Given your current working directory is the root of your sources, the following command executes the Chakram tests.

```bash
docker run -e MOCHA_GREP=@regression -e ENV=QA --rm -it -v ${PWD}:/usr/src/app vladimiraleksandrovcko/docker-chakram-nightmare
```

Environment variable **ENV** defines the target environment to test (e.g. _QA_, _DEV_), while environment variable **MOCHA_GREP** specifies the test scope. A _mochawesome_ test report will be saved in the current directory as specified by `${PWD}`.



## Image Details

The Docker image is based on `Node:slim` and upon build installs all the required Node.js Modules (as listed in `package.json`) along with shared dependencies for `electron` and `xvfb` ([X virtual framebuffer](https://en.wikipedia.org/wiki/Xvfb)) required for headless browser testing.

The Docker image neither installs nor uses any local modules from `node_modules` in `${PWF}`.

Any references to local `node_modules` should thus be avoided:

~~`var chakram = require('../../node_modules/chakram/lib/chakram.js')`~~
 `var chakram = require('chakram')`

 The Docker images executes command `npm run test` to run the tests.