(require 'sorella/dotemacs)
===========================

This is my emacs configuration, it's mostly for JavaScript and webdev
stuff. But also some of Python. It also has my own theme, that tries to
be colourful without being too much distracting.

![](http://dl.dropbox.com/u/4429200/candy-chain.png)


Requirements
------------

- Emacs 22+ (obviously)
- Git
- SVN
- Python
- Make
- [color-theme][]

**Optional stuff:**

- Node 0.4.2+
- CoffeeScript 1.0.0+


[color-theme]: http://www.nongnu.org/color-theme/


Building
--------

Simply change to the root dir, and run the make script (and I mean the
script, not the make tool...):

    cd ~/.emacs.d
    python make
    
This will pull everything you need from the interwebz (if you haven't
yet), byte compile the stuff and build some packages.
