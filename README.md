Raphanus's vimrc
============
Creator: Tsung-Hsiang (Sean) Chang <vgod@vgod.tw>

Modifier: Raphanus Lo

Fork me on GITHUB  https://github.com/COLDTURNIP/vimrc.

HOW TO INSTALL
--------------

1. Check out from github

        $ git clone https://github.com/COLDTURNIP/vimrc ~/.vim
        $ cd ~/.vim
        $ git submodule update --init

2. Install ~/.vimrc and ~/.gvimrc

        $ ./install-vimrc.sh

3. (Optional, if you want Command-T) Compile the Command-T plugin

        $ cd .vim/bundle/command-t/ruby/command-t
        $ ruby extconf.rb
        $ make

If you have some problem when updating submodule, such as

        $ git submodule update
        fatal: reference is not a tree: 2d7cfbd09fc96c04c4c41148d44ed7778add6b43
        Unable to checkout '2d7cfbd09fc96c04c4c41148d44ed7778add6b43' in submodule path 'mysubmodule'

then you may need to roll-back your parent repository and re-update submodules
to solve it. There's a good tutorial to solve such problems:

* [Stackoverflow: Git submodule head](http://stackoverflow.com/questions/2155887/git-submodule-head)

UPGRADE PLUGIN BUNDLES
----------------------

All plugins (except vim-latex) were checked out as git submodules,
which can be upgraded with `git pull`. For example, to upgrade Command-T

     $ cd ~/.vim/bundle/command-t
     $ git pull

HOW TO USE
----------

see the "USEFUL SHORTCUTS" section in vimrc to learn my shortcuts.

PLUGINS
-------

* [Pathogen](http://www.vim.org/scripts/script.php?script_id=2332): Pathogen let us install a plugin as a bundle in ~/.vim/bundle seprately.

* [AutoClose](http://www.vim.org/scripts/script.php?script_id=1849):  Inserts matching bracket, paren, brace or quote.

* [vim-surround](https://github.com/tpope/vim-surround/blob/master/doc/surround.txt): deal with pairs of surroundings.

* [matchit](http://www.vim.org/scripts/script.php?script_id=39): extended % matching for HTML, LaTeX, and many other languages.

* [xmledit](http://www.vim.org/scripts/script.php?script_id=301): XML/HTML tags will be completed automatically.

* [Command-T](https://github.com/wincent/Command-T): open and navigate between files with `cmd-t`.

* [YankRing](http://www.vim.org/scripts/script.php?script_id=1234): Maintains a history of previous yanks, changes and deletes

  `:help yankring` to see more info.

* [VisIncr](http://www.vim.org/scripts/script.php?script_id=670): Produce increasing/decreasing columns of numbers, dates, or daynames.

* [vim-latex](http://vim-latex.sourceforge.net/): Latex support.

* [OmniCppComplete](http://www.vim.org/scripts/script.php?script_id=1520): C/C++ omni-completion with ctags database.

* [JavaComplete](http://www.vim.org/scripts/script.php?script_id=1785): Java Omni-completion.

* [neocomplcache](http://www.vim.org/scripts/script.php?script_id=2620): great completion by making a cache of keyword in buffer.

* [taglist](http://www.vim.org/scripts/script.php?script_id=273): list definitions in current source file.

* [Source Explorer](http://www.vim.org/scripts/script.php?script_id=2179): a source code explorer provides an overview of the function and type definitions.

* [trinity](http://www.vim.org/scripts/script.php?script_id=2347): an IDE manager to control the three plugins open and close: taglist, Source Explorer, and [NERD tree](http://www.vim.org/scripts/script.php?script_id=1658).


Language specific supports
--------------------------

* Latex: Read `:help latex-suite.txt`
* Restructured Text: `ctrl-u 1~5` inserts Part/Chapter/Section headers
* HTML, Javascript, Python, CSS, C, C++, Java: use `TAB` to do omni-completion.
* HTML/XML: End tags are automatically completed after typing a begin tag. (Typing > twice pushes the end tag to a new line.)

Other good references
---------------------

* http://amix.dk/vim/vimrc.html
* http://spf13.com/post/perfect-vimrc-vim-config-file
