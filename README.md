# nvim-config
My neovim configurations
# usage

1.Install Packer.nvim.
```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2.Backup your original configuration.
```
mv ~/.config/nvim ~/.config/nvim.back 
```

3.Clone this repository.
```sh
git clone --depth 1 https://github.com/ston-afk/nvim-config\
 ~/.config/nvim
```

4.Run ":PackerSync" in neovim.
```vim
:PackerSync
```
