# docker-chakram-nightmare

The Docker image for running [Chakram](https://github.com/CKOTech/checkout-chakram) and [Nightmare](https://github.com/segmentio/nightmare).

## Command line use

Given your current working directory is the root of your sources, the following command executes the Chakram tests.

```bash
docker run -e MOCHA_GREP=@regression -e ENV=QA --rm -it -v ${PWD}:/usr/src/app vladimiraleksandrovcko/docker-chakram-nightmare
```

Environment variable **ENV** defines the target environment to test (e.g. _QA_, _DEV_), while environment variable **MOCHA_GREP** specifies the test scope. A _mochawesome_ test report will be saved in the current directory specified as by `${PWD}`.

