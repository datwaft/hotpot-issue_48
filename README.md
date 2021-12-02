# Issue

The issue is that when the compiler macro option `compilerEnv` is set to `_G`,
and you want to `require` a module that uses macro-exclusive functions from the
macro file, neovim displays the following error:

```error
.../packer/start/hotpot.nvim/fnl/hotpot/searcher/module.lua:113: Compile error in /root/.config/nvim/fnl/core/macro-utils.fnl:9
  symbols may only be used at compile time
        (= `fn (. x 1))
            ^^
            * Try moving this to inside a macro if you need to manipulate symbols/lists.
```

This could be the case if you want to share code between multiple macro files,
and therefore you create an utils module.

If you don't use that compiler macro option or you don't use an utils module
but have the code in the same macro file everything works perfectly.

## How to reproduce the issue

**Note:** you must have Docker installed on your computer.

Execute the following terminal command:

```shell
docker build -t hotpot-issue_48 . && docker run -it hotpot-issue_48
```

After that execute neovim:

```shell
nvim
```

## Expected result

```log
These lines should print "Hello"
================================
Hello
Hello
These lines should print "Bye"
==============================
Bye
Bye
Bye
```

## Current result

The following error is displayed.

```error
.../packer/start/hotpot.nvim/fnl/hotpot/searcher/module.lua:113: Compile error in /root/.config/nvim/fnl/core/macro-utils.fnl:9
  symbols may only be used at compile time
        (= `fn (. x 1))
            ^^
            * Try moving this to inside a macro if you need to manipulate symbols/lists.
```
