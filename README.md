# bg.nvim 🎆

`bg.nvim` automatically syncs terminal background with neovim colorscheme.

| - |bg.nvim |
|---|---|
|![without](https://user-images.githubusercontent.com/5502029/211703249-91bb0e37-5af0-4a73-9f33-9e1d55995d3c.png)|![with](https://user-images.githubusercontent.com/5502029/211703252-e19c6a42-e478-469a-9c08-b5730eba6921.png)|


## Install

```lua
use({ 'typicode/bg.nvim' })
```

## Usage

```lua
-- Set initial terminal background
-- bg.nvim will use it to restore your terminal background
require('bg').setup({ term = '#24273a' })

-- Or use an environment variable
require('bg').setup({ term = os.getenv('BG') })

-- Set your colorscheme after
vim.cmd.colorscheme('...')
```

## Try it

Change colorschemes, terminal background will match.

```
:colorscheme quiet
:colorscheme morning
```

## How it works

`bg.nvim` uses ANSI escape sequences to change your terminal background when you change colorscheme.

On exit, `bg.nvim` will set back terminal background to provided `term` color.

## Setting an environment variable

If you don't change your terminal colors often, hard coding your terminal background in `init.lua` is sufficient.

However if you want to make this value dynamic, you can use the following scripts to set a `BG` environment variable.

`printf "\033]11;?\007"` retrieves current terminal background.

### Fish

```fish
# functions/set_bg.fish
function set_bg
  printf "\033]11;?\007" 
  read -gx -n 22 BG
  set -gx BG (string sub -s 5 $BG)
  clear
end
```

```fish
# config.fish
# Set $BG on start
set_bg

# Or just before running neovim
function nvim
  set_bg
  command nvim $argv
end
```

### Zsh

```sh
# .zshrc
set_bg () {
  saved_stty="$(stty -g)"
  stty raw -echo min 0 time 1
  printf "\033]11;?\007"
  read -r BG
  export BG="$(echo $BG | cut -c6-24)" 
  stty "$saved_stty"
}

# Set $BG on start
set_bg

# Or just before running neovim
alias nvim="set_bg; nvim"
```
