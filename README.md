# nvim-config

![screenshot](resources/Screenshot_20221125_115248.png)

A Neovim configuration that works out of the box.

- Fast :
Most of the configuration files are written in lua.
- User friendly : Including many essential plugins.
- Lsp : Use nvim's built-in lsp.
- Floaterm
- Markdown preview
- Code runner
- ...

For more information, see plugins.lua.

## usage

1.Install Packer.nvim.

```sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```

2.Backup your original configuration.

```sh
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

## keymap

### Session

`<leader>ss` create a session

`<leader>sl` load a session

### Markdown

`<leader>m` markdown preview

### Outline

`<leader>o` symbols outline

### Buffers

`<leader>b` switch to a buffer

`]b` switch to next buffer

`[b` switch to previous buffer

`<leader>bd` delete a buffer

### Format

`<F4>` formatting the buffer with neoformat

### Terminal and finder

`<leader>ff` find file

`<leader>fg` find live_grep

`<leader>lg` lazygit

`<leader>lg` ranger

`<A-d>` toggle floating terminal

### Code Runner

`<leader>r` `<F5>` run code

`<leader>rf` run file

please refer to the `keybind.lua` for more keymaps.

### Nvim Tree

`<leader>n` toggle nvim tree

`<leader>nf` focus nvim tree

`<leader>nff` nvim tree find file

`<leader>nc` nvim tree collapse

### Lsp and autocompletion

`<C-Space>` trigger completion when there is no completion menu

`Tab` The same as space but comfirm the selection if you have selected one.

`<C-j>` `arrowdown` `<C-n>` select next completion item.

`<C-k>` `arrowup` `<C-p>` select next completion item.

`gh` run the lsp finder(lspsaga)

`ca` code action

`gr` rename

`gd` peek definition

see [lspsaga][lspsaga_configuration] for more information.

`cd` show the diagnostics of the symbol under the cursor

`e] [e`  `E] [E` go to the next(previous) diagnostic(error)

`K` show the document of the symbol under the cursor

[lspsaga_configuration]: https://github.com/glepnir/lspsaga.nvim#configuration
