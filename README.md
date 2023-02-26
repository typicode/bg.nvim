# bg.nvim 🎆

> `bg.nvim` automatically syncs terminal background with neovim colorscheme.

| -                                                                                                                 | bg.nvim                                                                                                        |
| ----------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------- |
| ![without1](https://user-images.githubusercontent.com/5502029/211707727-5713022d-93bc-4795-beb1-ede0d4b86839.png) | ![with1](https://user-images.githubusercontent.com/5502029/211707740-aceadea4-a710-4f88-9975-0244d6ef1eda.png) |
| ![without2](https://user-images.githubusercontent.com/5502029/211707779-f2ca5cc8-7b0f-4644-ad07-2f1faccf38b7.png) | ![with2](https://user-images.githubusercontent.com/5502029/211707792-ab1230ad-85b4-4b29-b956-25e5aebaa5bb.png) |
| Background doesn't match when using `:colorscheme` 😔                                                             | Background matches! 😀                                                                                         |

_Examples use [catppuccin](https://github.com/catppuccin/nvim) frappe and latte. Works with any colorschme._

## Install

```lua
-- Packer
use({ "typicode/bg.nvim" })
-- Lazy
"typicode/bg.nvim"
```

## How it works

`bg.nvim` uses escape sequences to change your terminal background when you change colorscheme.
