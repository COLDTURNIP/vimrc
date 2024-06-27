# Raphanus's VIM Configuration

This repository is the NeoVim configuration by Raphanus Lo.

## How To Use

This NeoVim configuration uses NvChad 2.5 starter kit as the base.

```
git clone --recurse-submodules https://github.com/COLDTURNIP/vimrc.git "$HOME/.config/nvim"
```

Then setup the configuration in NeoVim.

```
:Lazy sync
:MasonInstallAll
```

## Uninstall

```
rm -rf ~/.config/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.local/share/nvim
```

## Reference

* [NvChad](https://github.com/NvChad/NvChad): the base configuration
