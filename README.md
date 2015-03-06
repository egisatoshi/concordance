# English Writing Support System on Emacs

## Installation

1. Clone this repository on your computer.

```
$ git clone https://github.com/egisatoshi/concordance.git
```

2. Aadd the following line in your `.emacs`.

```
(load-file "path-to-concordance/elisp/concordance.el")
```

## How to use

1. Put text files under `~/.concordance/`

2. Press `M-M` on a word

<img width="100%" src="https://raw.githubusercontent.com/egisatoshi/concordance/master/images/demo.png" />

The above is a demonstration that listed up all usages of the word "introduce" from the R6RS.
(I have been developing [a new programming language](https://github.com/egison/egison).
When I am writing its manual, I refer to manuals of other languages to learn and verify the usage of a word.)

## LICENSE

Copyright (C) 2015, Satoshi Egi

This software is released under the MIT license.
