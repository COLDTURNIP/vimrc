# Raphanus's VIM Configuration

This repository is the NeoVim configuration by Raphanus Lo.

## How To Use

This NeoVim configuration uses NvChad as the base.

  git clone https://github.com/NvChad/NvChad "$HOME/.config/nvim" --depth 1
  git clone --recurse-submodules https://github.com/COLDTURNIP/vimrc.git "$HOME/.config/nvim/lua/custom"

Then setup the configuration in NeoVim.

  :PackerSync
  :NvChadUpdate

## Reference

* [NvChad](https://github.com/NvChad/NvChad): the base configuration
