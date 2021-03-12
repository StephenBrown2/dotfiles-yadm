# Make a dir and immediately cd into it, same as caarlos0/zsh-mkc
function mkcd(){ mkdir -p "${1}" && cd "${1}" || return 1 }

alias take=mkcd

# Change into a dir and immediately list its contents
function cdls(){ cd "${1}" && (exa || ls) }

# Date aliases
alias d8='date --iso-8601'
alias d8h='date --iso-8601=hour'
alias d8m='date --iso-8601=minute'
alias d8s='date --iso-8601=second'
alias d8t='date +%FT%T'
alias d8ts='date +%FT%T | sed "s/:/-/g"'

# Safety measures
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# `refresh cmd` executes clears the terminal and prints
# the output of `cmd` in it.
function refresh {
  tput clear || exit 2; # Clear screen. Almost same as echo -en '\033[2J';
  bash -ic "$@";
}

# Like watch, but with color
function cwatch {
   while true; do
     CMD="$@";
     # Cache output to prevent flicker. Assigning to variable
     # also removes trailing newline.
     output=`refresh "$CMD"`;
     # Exit if ^C was pressed while command was executing or there was an error.
     exitcode=$?; [ $exitcode -ne 0 ] && exit $exitcode
     printf '%s' "$output";  # Almost the same as echo $output
     sleep 1;
   done;
}
