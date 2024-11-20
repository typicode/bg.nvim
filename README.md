# bg.nvim 🎆

> `bg.nvim` automatically syncs terminal background and cursor with any neovim colorscheme.

## Demo

Changing colorscheme with and without `bg.nvim`.

https://github.com/user-attachments/assets/5699daaf-cc6e-4996-a334-b8b50e50896f

On the left, terminal background isn't synced with neovim, on the right it is and there's no inconsistency.

## Install

```lua
{ "typicode/bg.nvim", lazy = false }
```

## How it works

`bg.nvim` uses escape sequences to change your terminal background and cursor whenever you change your colorscheme. When neovim exits, it will restore the original colors.

Supported by modern terminals (alacritty, foot, gnome-terminal, kitty, wezterm, ...).

For reset colors support, [st](https://st.suckless.org/) needs to be [patched](https://pastebin.com/raw/3AthiL72).
