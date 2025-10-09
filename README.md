# Personal Neovim Configuration

This is a custom Neovim configuration using lazy.nvim for plugin management. It's designed to provide a modern IDE-like experience while maintaining Neovim's speed and efficiency.

## 🚀 Features

- Modern plugin management with lazy.nvim
- LSP support with auto-completion
- Syntax highlighting with Treesitter
- Fuzzy finding with Telescope
- Git integration with Fugitive
- Multiple color schemes
- And much more!

## ⚙️ Core Plugins and Their Functions

### Plugin Management
- **lazy.nvim**: Modern plugin manager with lazy-loading capabilities

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
  - `<C-y>`: Confirm completion
  - `<C-Space>`: Open completion menu
  - `<C-n>/<C-p>`: Navigate completion items

### 🎨 Appearance
- **rose-pine**: Default color scheme
- **tokyonight.nvim**: Alternative color scheme
- **lualine.nvim**: Status line
  - Shows git branch, file info, and diagnostics

### 🌳 Syntax & Languages
- **nvim-treesitter**: Advanced syntax highlighting
- **playground**: Treesitter playground for debugging

### 🛠️ Development Tools
- **trouble.nvim**: Better diagnostics display
  - `<leader>tt`: Toggle trouble
  - `[t/]t`: Navigate diagnostics
- **undotree**: Visual undo history
  - `<leader>u`: Toggle undotree
- **vim-fugitive**: Git integration
  - `<leader>gs`: Git status
  - `<leader>p`: Push
  - `<leader>P`: Pull with rebase

### 🧰 Utilities
- **harpoon**: Quick file navigation
  - `<leader>a`: Add file to harpoon
  - `<C-e>`: Toggle quick menu
  - `<C-h/j/k/l>`: Navigate to harpoon files
- **Comment.nvim**: Easy code commenting
  - `gcc`: Toggle line comment
  - `gc`: Toggle in visual mode
- **nvim-autopairs**: Auto-close brackets
- **zen-mode.nvim**: Distraction-free coding
  - `<leader>zz`: Toggle zen mode

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
│       ├── lazy_init.lua   # Lazy.nvim initialization
│       ├── set.lua         # Vim settings
│       ├── remap.lua       # Key mappings
│       └── lazy/           # Plugin configurations
│           ├── colors.lua  # Color schemes
│           ├── lsp.lua     # LSP configuration
│           └── ...         # Other plugin configs
```

## 🎨 Color Schemes
Available color schemes:
- rose-pine (default)
- tokyonight
- Additional themes can be added via plugins

## 🚀 Installation

1. Back up your existing Neovim configuration:
```bash
mv ~/.config/nvim ~/.config/nvim.backup
```

2. Clone this repository:
```bash
git clone https://github.com/SuhailJamal/nvim_configuration.git ~/.config/nvim
```

3. Start Neovim:
```bash
nvim
```

Lazy.nvim will automatically install all plugins on first launch.

## 📋 Requirements

- Neovim >= 0.8.0
- Git
- A C compiler for treesitter
- Node.js for LSP servers
- Ripgrep for Telescope grep

## 💡 Tips

1. Use `:checkhealth` to verify your setup
2. Use `:Lazy` to manage plugins
3. Use `:Mason` to manage LSP servers
4. Use `:TSInstall <language>` to install treesitter parsers

## 🤝 Acknowledgments

This configuration is inspired by ThePrimeagen's setup with modifications for personal use.


