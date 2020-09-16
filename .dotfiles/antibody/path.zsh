antibody() {
    eval "$(command antibody init -)"
    antibody "$@"
}