# Smart `Home` and `End` for Emacs.

Enables easy navigation with `Home` and `End` keys across wrapped lines (in Visual Line Mode).
- Hit the key once to navigate to the beginning/end of the wrapped (screen) line.
- Hit the key again to navigate to the beginning/end of the previous/next wrapped (screen) line.
- Repeat until you reach the beginning/end of the logical line.
- `Home` key additionally supports jumping between the first non-blank character in the logical line and start of the logical line.


### Setup

```
(require 'emacs-smart-home-end)

(global-set-key [home] 'emacs-smart-home)
(global-set-key [end]  'emacs-smart-end)
```
