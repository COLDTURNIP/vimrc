# Raphanus's VIM Configuration

This repository is the NeoVim configuration by Raphanus Lo.

## How To Use

This NeoVim configuration uses NvChad as the base.

  git clone https://github.com/NvChad/starter "$HOME/.config/nvim"
  rm -rf "$HOME/.config/nvim/.git"
  git clone --recurse-submodules https://github.com/COLDTURNIP/vimrc.git "$HOME/.config/nvim/lua/custom"

Then setup the configuration in NeoVim.

  :Lazy sync
  :MasonInstallAll

## Uninstall

```
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

## Reference

* [NvChad](https://github.com/NvChad/NvChad): the base configuration
