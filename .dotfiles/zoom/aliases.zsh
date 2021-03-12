function zoom(){
    if (( $# == 1 )); then
        if [[ $1 =~ http ]]; then
            open "$(echo ${1} | sed 's/^https:/zoommtg:/;s|/j/|/join?action=join\&confno=|;s/?pwd=/\&pwd=/')"
        else
            # open "zoommtg://rackspace.zoom.us/my/${1}"
            open "zoommtg://rackspace.zoom.us/join?action=join&confno=${1}"
        fi
    elif (( $# == 2 )); then
        # open "zoommtg://rackspace.zoom.us/j/${1}?pwd=${2}"
        open "zoommtg://rackspace.zoom.us/join?action=join&confno=${1}&pwd=${2}"
    else
        echo "Not sure what to do with: $@"
    fi
}
