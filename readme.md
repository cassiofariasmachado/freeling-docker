# Freeling Docker

A docker image to use [Freeling](http://nlp.lsi.upc.edu/freeling/).

## Usage

``` bash
docker build -t cassiofariasmachado/freeling .
```

You can change the following args too:

``` bash
docker build -t cassiofariasmachado/freeling \
    --build-arg LOCALE=pt_BR.UTF-8 LOCALE_CONFIG=pt.cfg LANGUAGE=pt_BR .
```

## Reference

* [Official image](https://github.com/TALP-UPC/FreeLing/tree/master/APIs/docker).