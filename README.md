dotfiles
========

* **zsh** aliases, auto-completion, prompt
* **git** config
* **vim** config, depends on [vundle](https://github.com/gmarik/Vundle.vim)
* **tmux** config
* **osx** quick setup (a ton of tweaks, see [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles))
* **[homebrew](http://brew.sh)** quick setup

Install
-------

* Adapt `$DOTFILESDIR` in `zshrc`
* Run `source zshrc` once to propagate `$DOTFILESDIR`env
* For private configurations use `~/.zsh_secret`
* Execute

```
ln -s "${DOTFILESDIR}/zshrc" "${HOME}/.zshrc" 
ln -s "${DOTFILESDIR}/gitconfig" "${HOME}/.gitconfig" 
ln -s "${DOTFILESDIR}/vimrc" "${HOME}/.vimrc" 
ln -s "${DOTFILESDIR}/tmux.conf" "${HOME}/.tmux.conf" 
source "${DOTFILESDIR}/bin/osx.sh"
source "${DOTFILESDIR}/bin/brew.sh"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

* Open `vim` and use `:PluginInstall`
