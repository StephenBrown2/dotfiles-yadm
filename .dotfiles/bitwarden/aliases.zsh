# BitWarden session unlock
function bwu(){
  bw unlock --check || export BW_SESSION=$(bw unlock --raw $1)
}
