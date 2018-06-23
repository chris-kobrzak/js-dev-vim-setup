JavaScript development Vim set-up
=================================

The set-up has a number of plugins and templates that could be useful for
JavaScript and React development. What you get is JSX, Emmet and multiple
cursors support as well as a `.jsx` template with a React component defined in
ES6, both in a class and a stateless function form. And more!

The files in this repository should be placed under the `~/.vim` directory.

# Set-up

```
git clone https://github.com/chris-kobrzak/js-dev-vim-setup.git ~/.vim
ln -s ~/.vim/.vimrc ~/.vimrc

cd ~/.vim
git submodule init
git submodule update
```

# Useful shortcuts

**jj** - switch from insert to normal mode

**Ctrl-t** - show file system explorer

**Ctrl-p** - free text file name search

**Ctrl-n** - select multiple instances of a selected word (like SublimeText multiple
cursors)

**Ctrl-l** - toggle line numbers (including relative to the current line)

**:Ls** - show file buffer list ordered alphabetically

# Working with plugins

## Getting plugins up-to-date

```git submodule update --recursive --remote```

## Adding more plugins example

```git submodule add https://github.com/mxw/vim-jsx.git bundle/vim-jsx.vim```
