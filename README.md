# Neovim Configuration

A minimal, fast Neovim setup built on [lazy.nvim](https://github.com/folke/lazy.nvim).
Targets **Neovim 0.11+** (tested on v0.12.1).

---

## 🚀 Features

- **LSP** — mason-lspconfig v2 with 12 language servers auto-installed
- **Completion** — nvim-cmp: LSP, snippets, buffer words, file paths, command mode
- **Formatting** — conform.nvim with format-on-save for 15+ filetypes
- **Syntax** — nvim-treesitter (main branch, native Neovim 0.11+ highlighting)
- **Fuzzy finding** — telescope.nvim
- **Git** — vim-fugitive
- **Navigation** — harpoon2 for quick file switching
- **Diagnostics** — trouble.nvim + fidget.nvim
- **Refactoring** — refactoring.nvim (lazy-loaded)
- **Snippets** — LuaSnip + friendly-snippets

---

## 🌐 Language Support

| Language | LSP | Treesitter | Formatter |
|---|:---:|:---:|:---:|
| Lua | `lua_ls` | ✅ | `stylua` |
| JavaScript | `ts_ls` | ✅ | `prettier` |
| TypeScript | `ts_ls` | ✅ | `prettier` |
| JSX / TSX | `ts_ls` | ✅ | `prettier` |
| Python | `pyright` | ✅ | `isort` + `black` |
| C / C++ | `clangd` | ✅ | `clang_format` |
| Rust | `rust_analyzer` | ✅ | `rustfmt` |
| HTML | `html` | ✅ | `prettier` |
| CSS | `cssls` | ✅ | `prettier` |
| Tailwind CSS | `tailwindcss` | — | — |
| JSON | `jsonls` | ✅ | `prettier` |
| YAML | `yamlls` | ✅ | `prettier` |
| Markdown | `marksman` | ✅ | `prettier` |
| Bash / Shell | `bashls` | ✅ | `shfmt` |
| GraphQL | — | — | `prettier` |
| Vim / Vimdoc | — | ✅ | — |

---

## ✂️ Completion Sources

| Mode | Source | What it provides |
|---|---|---|
| Insert | `nvim_lsp` | Symbols, types, imports from language server |
| Insert | `luasnip` | Code snippet expansion |
| Insert | `buffer` | Words already in open buffers |
| Insert | `path` | Filesystem path completion |
| `/` `?` search | `buffer` | Buffer words while searching |
| `:` command | `cmdline` | Ex commands and subcommands |
| `:` command | `path` | File paths in command arguments |

### Completion Keymaps

| Key | Action |
|---|---|
| `<C-n>` | Next suggestion |
| `<C-p>` | Previous suggestion |
| `<C-y>` | Confirm selection |
| `<C-i>` | Manually trigger menu |
| `<C-s>e` | Expand snippet |
| `<C-s>;` | Jump to next snippet field |
| `<C-s>,` | Jump to previous snippet field |
| `<C-E>` | Cycle snippet choice |

---

## ⌨️ Key Mappings

> `<leader>` = `<Space>`

### General
| Key | Action |
|---|---|
| `<leader>e` | Open file explorer (netrw) |
| `<leader>f` | Format buffer |
| `<leader>s` | Search & replace word under cursor |
| `<leader>x` | `chmod +x` current file *(Unix only)* |
| `<C-d>` / `<C-u>` | Scroll half-page, cursor centred |
| `<C-f>` | New tmux window with sessionizer *(Unix only)* |
| `<leader>vpp` | Open lazy_init.lua config |
| `<leader><leader>` | Source current file |
| `<leader>ee` | Insert Go error handling snippet |

### LSP
| Key | Action |
|---|---|
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<leader>vws` | Workspace symbol search |
| `<leader>vd` | Open diagnostic float |
| `<leader>vca` | Code action |
| `<leader>vrr` | References |
| `<leader>vrn` | Rename symbol |
| `<C-h>` | Signature help (insert mode) |
| `[d` / `]d` | Navigate diagnostics |

### Telescope
| Key | Action |
|---|---|
| `<leader>ff` | Find files |
| `<C-p>` | Git files |
| `<leader>fs` | Grep search (prompt) |
| `<leader>pws` | Grep word under cursor |
| `<leader>pWs` | Grep WORD under cursor |
| `<leader>vh` | Help tags |

### Harpoon
| Key | Action |
|---|---|
| `<leader>a` | Add file to harpoon |
| `<C-e>` | Toggle harpoon quick menu |
| `<C-h>` | Jump to file 1 |
| `<C-j>` | Jump to file 2 |
| `<C-k>` | Jump to file 3 |
| `<C-l>` | Jump to file 4 |

### Git (Fugitive)
| Key | Action |
|---|---|
| `<leader>gs` | Git status |
| `<leader>p` | Git push *(in fugitive buffer)* |
| `<leader>P` | Git pull --rebase *(in fugitive buffer)* |
| `gu` / `gh` | Accept diff from left / right |

### Trouble
| Key | Action |
|---|---|
| `<leader>tt` | Toggle diagnostics list |
| `<leader>tT` | Toggle buffer diagnostics |
| `[t` / `]t` | Navigate trouble items |

### Quickfix / Loclist
| Key | Action |
|---|---|
| `<leader>cn` | Next quickfix item |
| `<leader>cp` | Previous quickfix item |
| `<leader>k` | Next loclist item |
| `<leader>j` | Previous loclist item |

### Refactoring *(visual mode)*
| Key | Action |
|---|---|
| `<leader>ri` | Inline variable |
| `<leader>re` | Extract variable |
| `<leader>rr` | Extract function |

### Clipboard
| Key | Action |
|---|---|
| `<leader>y` | Yank to system clipboard |
| `<leader>Y` | Yank line to system clipboard |
| `<leader>d` | Delete to void register |
| `<leader>p` | Paste without overwriting register |

### Misc
| Key | Action |
|---|---|
| `<leader>u` | Toggle undotree |
| `Q` | Disabled (no-op) |
| `<C-c>` | Escape (insert mode alias) |

---

## 📁 File Structure

```
~/.config/nvim/
├── init.lua                        # Entry point
├── lazy-lock.json                  # Plugin version lock
└── lua/
    └── theprimeagen/
        ├── init.lua                # Autocommands, LspAttach, filetype config
        ├── lazy_init.lua           # lazy.nvim bootstrap & performance settings
        ├── remap.lua               # Global keymaps
        ├── set.lua                 # Vim options
        └── lazy/                   # Per-plugin configs
            ├── colors.lua          # rose-pine theme
            ├── formatting.lua      # conform.nvim
            ├── fugitive.lua        # vim-fugitive
            ├── harpoon.lua         # harpoon2
            ├── init.lua            # refactoring.nvim
            ├── local.lua           # nvim-autopairs, Comment.nvim
            ├── lsp.lua             # LSP, mason, nvim-cmp, LuaSnip
            ├── lualine.lua         # statusline
            ├── telescope.lua       # fuzzy finder
            ├── treesitter.lua      # syntax / parsing
            ├── trouble.lua         # diagnostics UI
            └── undotree.lua        # undo history
```

---

## 🖥️ Windows Compatibility

All plugins work on Windows. Two keymaps are Unix-only and automatically
disabled on Windows:
- `<C-f>` (tmux sessionizer)
- `<leader>x` (chmod)

**Extra steps on Windows:**
1. Install `tree-sitter` CLI: `npm install -g tree-sitter-cli`
2. Install a C compiler (LLVM/clang recommended): `winget install LLVM.LLVM`
3. Install `fd` and `ripgrep` for Telescope: `winget install BurntSushi.ripgrep.MSVC sharkdp.fd`

---

## 🔧 Requirements

| Tool | Purpose |
|---|---|
| Neovim 0.11+ | Required (tested on 0.12.1) |
| `git` | lazy.nvim plugin cloning |
| `tree-sitter` CLI | nvim-treesitter parser compilation |
| `gcc` or `clang` | Parser compilation backend |
| `node` + `npm` | Many Mason LSP servers |
| `fd` | Telescope file finding |
| `ripgrep` | Telescope live grep |
