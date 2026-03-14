# Personal Neovim Configuration

This is a custom Neovim configuration using lazy.nvim for plugin management. It's designed to provide a modern IDE-like experience while maintaining Neovim's speed and efficiency.

## 🚀 Features

- **Modern Plugin Management**: Powered by [lazy.nvim](https://github.com/folke/lazy.nvim) with optimized RTP and lazy-loading.
- **LSP Support**: Intelligent code completion and diagnostics via [lsp-zero.nvim](https://github.com/VonHeikemen/lsp-zero.nvim).
- **Auto-Formatting**: Robust "format on save" using [conform.nvim](https://github.com/stevearc/conform.nvim).
- **AI-Assisted Coding**: Integrated [Copilot.lua](https://github.com/zbirenbaum/copilot.lua) for smart suggestions.
- **Session Management**: Automatically save and restore sessions with [persistence.nvim](https://github.com/folke/persistence.nvim).
- **Syntax Highlighting**: Advanced parsing with [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter).
- **Fuzzy Finding**: Powerful search and navigation with [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim).
- **Git Integration**: Seamless Git workflow via [vim-fugitive](https://github.com/tpope/vim-fugitive).
- **Security**: Sensitive data masking with [cloak.nvim](https://github.com/laytan/cloak.nvim).

## ⚙️ Core Plugins and Their Functions

### 🔍 File Navigation & Search
- **telescope.nvim**: Fuzzy finder and much more
  - `<leader>ff`: Find files
  - `<C-p>`: Git files
  - `<leader>fs`: Grep search
  - `<leader>vh`: Help tags
  - `<leader>pws`: Search current word

### 📝 LSP & Completion
- **lsp-zero.nvim**: Easy LSP setup
- **mason.nvim**: LSP package management
- **nvim-cmp**: Completion engine
- **Copilot.lua**: AI code completion
  - `<M-l>`: Accept suggestion
  - `<M-]>`: Next suggestion
  - `<M-[>`: Previous suggestion

### 🛠️ Development Tools
- **conform.nvim**: Auto-formatting
  - `<leader>f`: Format buffer (also happens on save)
- **persistence.nvim**: Session management
  - `<leader>qs`: Restore session for current directory
  - `<leader>ql`: Restore last session
  - `<leader>qd`: Stop persistence (don't save session)
- **trouble.nvim**: Better diagnostics display
- **undotree**: Visual undo history
- **vim-fugitive**: Git integration

### 🧰 Utilities
- **harpoon**: Quick file navigation
  - `<leader>a`: Add file to harpoon
  - `<C-e>`: Toggle quick menu
  - `<C-h/j/k/l>`: Navigate to harpoon files
- **Comment.nvim**: Easy code commenting
- **nvim-autopairs**: Auto-close brackets
- **zen-mode.nvim**: Distraction-free coding

### 🔐 Security
- **cloak.nvim**: Hide sensitive data in certain files
  - Automatically hides values in .env files

## ⌨️ Key Mappings

### General
- `<leader>` is mapped to `<Space>`
- `<leader>e`: Open file explorer
- `<leader>f`: Format buffer
- `<C-d>/<C-u>`: Scroll half page with centered cursor
- `<leader>s`: Search and replace current word
- `<leader>x`: Make current file executable

### LSP
- `gd`: Go to definition
- `K`: Hover information
- `<leader>vws`: Workspace symbol search
- `<leader>vd`: Open diagnostic float
- `<leader>vca`: Code action
- `<leader>vrr`: References
- `<leader>vrn`: Rename
- `<C-h>`: Signature help
- `[d/]d`: Navigate diagnostics

## 📁 File Structure
```
nvim/
├── init.lua                 # Entry point
├── lua/
│   └── theprimeagen/       # Configuration directory
│       ├── init.lua        # Main config file
│       ├── lazy_init.lua    # Lazy.nvim setup & performance tuning
│       └── lazy/            # Plugin-specific configurations
```
