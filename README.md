# Savedo Localizer

A tiny tool that allows to bootstrap localizations using GoogleTranslate.

## Installation

Make sure you have [Crystal installed](http://crystal-lang.org/docs/installation/)

Install dependencies:
```
crystal deps
```

Build it:

```
make
```

Check it:
```
./bin/savedo-localizer --help
```

## Usage

Translate English texts from `en.json` file to German and save it in `de.json`:

```
savedo-localizer --from en --to de --input ./en.json --output ./de.json
```

## Contributors

- [greyblake](https://github.com/greyblake) Sergey Potapov - creator, maintainer
