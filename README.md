# dotfiles

i3, alacritty, ranger, neovim.

## prereqs

**core**
- neovim >= 0.11
- git
- a C compiler (treesitter needs it)

**lsp servers** (install what you need)
```
clangd             # C/C++/STM32
pyright            # Python
lua-language-server
typescript-language-server
gopls
rust-analyzer
```

**formatters / linters**
```
clang-format       # C/C++
clang-tidy         # C/C++ linting
stylua             # Lua
ruff               # Python format + lint
prettierd          # JS/TS
```

**other**
- `ctx` — used by `<leader>cx` to copy project context
- `arm-none-eabi-gcc` — STM32/embedded cross-compiler (clangd queries it for HAL includes)
- For STM32 projects: a `compile_commands.json` in the project root (`cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON` or `bear -- make`)

## setup

```sh
git clone <repo> ~/dotfiles
cd ~/dotfiles
./bootstrap.sh
```

On first `nvim` launch, lazy.nvim installs itself and all plugins automatically.

## keymaps

leader = `space`

### general

| key | action |
|-----|--------|
| `<leader>pv` | oil (file explorer) |
| `<leader>v` | netrw |
| `<leader>w` | window commands prefix |
| `<leader>u` | undotree toggle |
| `<leader>xxd` | hex view |
| `<leader>cx` | copy context (ctx) |
| `<leader>cc` | open Claude (bottom split) |
| `t <Esc><Esc>` | exit terminal mode |

### lsp

| key | action |
|-----|--------|
| `gd` | go to definition |
| `gi` | go to implementation |
| `gr` | references |
| `K` | hover |
| `<leader>e` | diagnostic float |
| `<leader>xx` | all diagnostics (trouble) |
| `<leader>xd` | buffer diagnostics (trouble) |

### telescope

| key | action |
|-----|--------|
| `<leader>pf` | find files |
| `<C-p>` | git files |
| `<leader><leader>` | buffers |
| `<leader>ps` | grep |

### harpoon

| key | action |
|-----|--------|
| `<leader>a` | add file |
| `<C-e>` | quick menu |
| `<leader>1-4` | jump to file |

### git

| key | action |
|-----|--------|
| `<leader>gs` | fugitive |
| `]c` / `[c` | next / prev hunk |
| `<leader>hs` | stage hunk |
| `<leader>hr` | reset hunk |
| `<leader>hb` | blame line |

### surround (mini.surround)

| key | action |
|-----|--------|
| `sa` | add surround |
| `sd` | delete surround |
| `sr` | replace surround |
