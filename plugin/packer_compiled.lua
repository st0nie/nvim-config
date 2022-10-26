-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/core3545/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/core3545/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/core3545/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/core3545/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/core3545/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-cmdline"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-tabnine"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\0\0=\4\4\3B\1\2\1K\0\1\0\23ignored_file_types\1\0\6\tsort\2\29show_prediction_strength\1\24snippet_placeholder\a..\27run_on_every_keystroke\2\20max_num_results\3\20\14max_lines\3�\a\nsetup\23cmp_tabnine.config\frequire\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/cmp-tabnine",
    url = "https://github.com/tzachar/cmp-tabnine"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["code_runner.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rfiletype\1\0\0\1\0\3\rPKGBUILD\16makepkg -sc\vpython\15python3 -u\6cRcd $dir && clang $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt\nsetup\16code_runner\frequire\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/code_runner.nvim",
    url = "https://github.com/CRAG666/code_runner.nvim"
  },
  ["dashboard-nvim"] = {
    config = { "\27LJ\2\n�\r\0\0\3\0\v\0\0206\0\0\0'\2\1\0B\0\2\0025\1\3\0=\1\2\0004\1\a\0005\2\5\0>\2\1\0015\2\6\0>\2\2\0015\2\a\0>\2\3\0015\2\b\0>\2\4\0015\2\t\0>\2\5\0015\2\n\0>\2\6\1=\1\4\0K\0\1\0\1\0\3\ticon\n  \vaction\24edit ~/.config/nvim\tdesc\"Open Personal dotfiles       \1\0\3\ticon\n  \vaction\24Telescope live_grep\tdesc\"Find word                    \1\0\3\ticon\n  \vaction\fedit ./\tdesc\"File Browser                 \1\0\3\ticon\n  \vaction\25Telescope find_files\tdesc\"Find File                    \1\0\3\ticon\n  \vaction\23Telescope oldfiles\tdesc\"Recently opened files        \1\0\3\ticon\n  \vaction#source ~/.vim_recently_session\tdesc\"Recently latest session      \18custom_center\1\r\0\0007                                                  7                                                  7                                                  �\1███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗�\1████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║�\1██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║�\1██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║�\1██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║�\1╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝7                                                  7                                                  7                                                  \18custom_header\14dashboard\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/opt/dashboard-nvim",
    url = "https://github.com/glepnir/dashboard-nvim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\v\0\0256\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0B\0\2\1K\0\1\0\1\0\2\25space_char_blankline\6 \21show_end_of_line\2\nsetup\21indent_blankline\frequire\feol:↴\14space:⋅\vappend\14listchars\tlist\bopt\bvim\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\0\1\0\2\nright\6|\tleft\6|\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  neoformat = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/neoformat",
    url = "https://github.com/sbdchd/neoformat"
  },
  ["nvim-autopairs"] = {
    after = { "nvim-cmp" },
    config = { "\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\ni\0\0\3\0\5\0\b6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\1K\0\1\0\16cmp_setting\frequire*set completeopt=menu,menuone,noselect\bcmd\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n�\2\0\0\t\0\f\0\0265\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0016\3\4\0009\3\5\0039\3\6\0039\3\a\3B\3\1\0A\1\0\2)\2\1\0\21\3\0\0)\4\1\0M\2\n�6\6\1\0'\b\b\0B\6\2\0028\a\5\0008\6\a\0069\6\t\0065\b\n\0=\1\v\bB\6\2\1O\2�\127K\0\1\0\17capabilities\1\0\0\nsetup\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\25default_capabilities\17cmp_nvim_lsp\frequire\1\5\0\0\fpyright\16sumneko_lua\vclangd\18rust_analyzer\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    after = { "dashboard-nvim" },
    config = { "\27LJ\2\n�\2\0\0\a\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\16diagnostics\1\0\2\venable\2\17show_on_dirs\2\rrenderer\1\0\1\16group_empty\2\tview\rmappings\tlist\1\0\0\1\0\2\vaction\vdir_up\bkey\6u\1\0\1\18adaptive_size\2\1\0\1\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\1\17auto_install\1\1\6\0\0\6c\blua\vpython\trust\rmarkdown\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["symbols-outline.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/symbols-outline.nvim",
    url = "https://github.com/simrat39/symbols-outline.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-floaterm"] = {
    config = { "\27LJ\2\nZ\0\0\2\0\4\1\t6\0\0\0009\0\1\0*\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0K\0\1\0\20floaterm_height\19floaterm_width\6g\bvim��̙\19����\3\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/vim-floaterm",
    url = "https://github.com/voldikss/vim-floaterm"
  },
  ["vscode.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\23colorscheme vscode\bcmd\bvim\0" },
    loaded = true,
    path = "/home/core3545/.local/share/nvim/site/pack/packer/start/vscode.nvim",
    url = "https://github.com/Mofiqul/vscode.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n@\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n�\2\0\0\t\0\f\0\0265\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0016\3\4\0009\3\5\0039\3\6\0039\3\a\3B\3\1\0A\1\0\2)\2\1\0\21\3\0\0)\4\1\0M\2\n�6\6\1\0'\b\b\0B\6\2\0028\a\5\0008\6\a\0069\6\t\0065\b\n\0=\1\v\bB\6\2\1O\2�\127K\0\1\0\17capabilities\1\0\0\nsetup\14lspconfig\29make_client_capabilities\rprotocol\blsp\bvim\25default_capabilities\17cmp_nvim_lsp\frequire\1\5\0\0\fpyright\16sumneko_lua\vclangd\18rust_analyzer\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: cmp-tabnine
time([[Config for cmp-tabnine]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0004\4\0\0=\4\4\3B\1\2\1K\0\1\0\23ignored_file_types\1\0\6\tsort\2\29show_prediction_strength\1\24snippet_placeholder\a..\27run_on_every_keystroke\2\20max_num_results\3\20\14max_lines\3�\a\nsetup\23cmp_tabnine.config\frequire\0", "config", "cmp-tabnine")
time([[Config for cmp-tabnine]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\v\0\0256\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\5\0B\0\3\0016\0\0\0009\0\1\0009\0\3\0\18\2\0\0009\0\4\0'\3\6\0B\0\3\0016\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0B\0\2\1K\0\1\0\1\0\2\25space_char_blankline\6 \21show_end_of_line\2\nsetup\21indent_blankline\frequire\feol:↴\14space:⋅\vappend\14listchars\tlist\bopt\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: vim-floaterm
time([[Config for vim-floaterm]], true)
try_loadstring("\27LJ\2\nZ\0\0\2\0\4\1\t6\0\0\0009\0\1\0*\1\0\0=\1\2\0006\0\0\0009\0\1\0*\1\0\0=\1\3\0K\0\1\0\20floaterm_height\19floaterm_width\6g\bvim��̙\19����\3\0", "config", "vim-floaterm")
time([[Config for vim-floaterm]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\ng\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\16diagnostics\rnvim_lsp\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: symbols-outline.nvim
time([[Config for symbols-outline.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20symbols-outline\frequire\0", "config", "symbols-outline.nvim")
time([[Config for symbols-outline.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\frainbow\1\0\2\venable\2\18extended_mode\2\14highlight\1\0\2\venable\2&additional_vim_regex_highlighting\1\21ensure_installed\1\0\1\17auto_install\1\1\6\0\0\6c\blua\vpython\trust\rmarkdown\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n�\2\0\0\a\0\14\0\0196\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\6\0004\5\3\0005\6\5\0>\6\1\5=\5\a\4=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\16diagnostics\1\0\2\venable\2\17show_on_dirs\2\rrenderer\1\0\1\16group_empty\2\tview\rmappings\tlist\1\0\0\1\0\2\vaction\vdir_up\bkey\6u\1\0\1\18adaptive_size\2\1\0\1\fsort_by\19case_sensitive\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: code_runner.nvim
time([[Config for code_runner.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rfiletype\1\0\0\1\0\3\rPKGBUILD\16makepkg -sc\vpython\15python3 -u\6cRcd $dir && clang $fileName -o $fileNameWithoutExt && $dir/$fileNameWithoutExt\nsetup\16code_runner\frequire\0", "config", "code_runner.nvim")
time([[Config for code_runner.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n�\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\0\1\0\2\nright\6|\tleft\6|\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: vscode.nvim
time([[Config for vscode.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\23colorscheme vscode\bcmd\bvim\0", "config", "vscode.nvim")
time([[Config for vscode.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd telescope.nvim ]]
vim.cmd [[ packadd dashboard-nvim ]]

-- Config for: dashboard-nvim
try_loadstring("\27LJ\2\n�\r\0\0\3\0\v\0\0206\0\0\0'\2\1\0B\0\2\0025\1\3\0=\1\2\0004\1\a\0005\2\5\0>\2\1\0015\2\6\0>\2\2\0015\2\a\0>\2\3\0015\2\b\0>\2\4\0015\2\t\0>\2\5\0015\2\n\0>\2\6\1=\1\4\0K\0\1\0\1\0\3\ticon\n  \vaction\24edit ~/.config/nvim\tdesc\"Open Personal dotfiles       \1\0\3\ticon\n  \vaction\24Telescope live_grep\tdesc\"Find word                    \1\0\3\ticon\n  \vaction\fedit ./\tdesc\"File Browser                 \1\0\3\ticon\n  \vaction\25Telescope find_files\tdesc\"Find File                    \1\0\3\ticon\n  \vaction\23Telescope oldfiles\tdesc\"Recently opened files        \1\0\3\ticon\n  \vaction#source ~/.vim_recently_session\tdesc\"Recently latest session      \18custom_center\1\r\0\0007                                                  7                                                  7                                                  �\1███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗�\1████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║�\1██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║�\1██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║�\1██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║�\1╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝7                                                  7                                                  7                                                  \18custom_header\14dashboard\frequire\0", "config", "dashboard-nvim")

vim.cmd [[ packadd nvim-cmp ]]

-- Config for: nvim-cmp
try_loadstring("\27LJ\2\ni\0\0\3\0\5\0\b6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\3\0'\2\4\0B\0\2\1K\0\1\0\16cmp_setting\frequire*set completeopt=menu,menuone,noselect\bcmd\bvim\0", "config", "nvim-cmp")

time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
