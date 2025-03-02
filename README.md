# Ladybird Browser Test Container

## Intro

Because of the recent announced changes of the terms-of-use of firefox, I wanted to test the current state of the ladybird web-browser ( https://github.com/LadybirdBrowser/ladybird ) to check, if this could be a good alternative for firefox in the near future. This browser is still not in the state to provide packages, so for tests it has to be build by yourself currently. Because this build-process ( https://github.com/LadybirdBrowser/ladybird/blob/master/Documentation/BuildInstructionsLadybird.md ) requires Qt6 and I wanted to avoid conflicts with the Qt5 of my Kubunutu system, I build the repository within a docker-image, where it also can be started right out of the container. Because of the X11-forwarding, the performance is not very good, but I just wanted to get a first impression of the current features. Maybe other ones are also interested to test it, so I made the image available on docker-hub (instructions see below). **Important: If you test it, then please keep in mind, that the performance here is bad because of the use of X11-forwarding and NOT because of the browser itself.**

## How to use

Start the pre-build docker-image ( https://hub.docker.com/r/kitsudaiki/ladybird-browser-test ) and forward X11:

```bash
docker run --rm -it \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    kitsudaiki/ladybird-browser-test
```

(tested it on my Kubuntu only so far. So I'm not sure, if this way works for all linux host systems)

## How to build

If you want to build the image by yourself:

```bash
cd ladybird-browser-test
docker build -t ladybird-browser-test .
```
