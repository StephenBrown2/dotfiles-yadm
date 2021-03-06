# Dotfiles for my Mac

## Installation

### Dependencies

First, make sure you have all those things installed:

- `git`: to clone the repo
- `curl`: to download some stuff
- `tar`: to extract downloaded stuff
- `zsh`: to actually run the dotfiles
- `sudo`: some configs may need that

### Install

Then, run these steps:

```console
$ yadm clone https://github.com/StephenBrown2/dotfiles-yadm.git
$ zsh # or just close and open your terminal again.
```

> All changed files will be backed up with a `.backup` suffix.

### Recommended Software

For macOS, I recommend:

- iTerm: a better terminal emulator;

For both Linux and macOS:

- [`diff-so-fancy`](https://github.com/so-fancy/diff-so-fancy):
better git difs (you'll need to run `dot_update` to apply it);
- [`fzf`](https://github.com/junegunn/fzf):
fuzzy finder, used in `,t` on vim, for example;
- [`kubectx`](https://github.com/ahmetb/kubectx) for better kubernetes context
  and namespace switch;

### macOS defaults

You use it by running:

```console
$DOTFILES/macos/set-defaults.sh
```

And logging out and in again/restart.
