# coin
### a coin flipper written in assembly for fun

## summary
coin is a program written for linux using intel x86 assembly.
coin is assembled with the GNU assembler.

## downloading
to download it, select the zip option, or to download using git
```sh
$ git clone https://github.com/georgedance/coin.git
```

## building
to build it into an executable ELF binary, just run
```sh
$ make
```

## installation
to install it to `/usr/local/bin` (it should be part of your `$PATH`), just run
```
# make install
```

## usage
just invoke the program via the executable ELF binary or via your `$PATH`.

| result | effect |
| ------ | ------ |
| Heads  | print "Heads!", return 0 |
| Tails  | print "Tails!", return 1 |

