export PYENV_ROOT="$HOME/.pyenv"

# pyenv-virtualenv: prompt changing will be removed from future release.
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Tell pyenv where openssl is (and make pythons a little faster)
export CFLAGS="-O2 -I${HOMEBREW_PREFIX_OPENSSL}/include"
export LDFLAGS="-L${HOMEBREW_PREFIX_OPENSSL}/lib"

# path=($PYENV_ROOT/bin $path)

pyenv() {
  eval "$(command pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
  pyenv "$@"
}
