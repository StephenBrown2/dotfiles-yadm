# Set up ObjectRocket k8s contexts
alias k8s_export_all="k8s_export_dev; k8s_export_stg; k8s_export_prd"

# Zoom
alias hieva="zoom hieva dlJ1YTdSMExFVVQxYnc3L3dHZm5VUT09"
alias hieva="zoom hieva"
alias hieva="zoom 2102488755 dlJ1YTdSMExFVVQxYnc3L3dHZm5VUT09"
alias jwixel="zoom jwixel QlM0aGJvZVFkMWYrS0kvb0ZaRE0wUT09"

# VPN
alias or-conn-all="osascript ~/.dotfiles/objectrocket/or-connect-all.scpt"
alias or-conn-rf="osascript ~/.dotfiles/objectrocket/or-connect-rf.scpt"
alias or-disconnect-all="osascript ~/.dotfiles/objectrocket/or-disconnect-all.scpt"

# Env vars
export INFRA_API_CLIENT_KUBE_CONTEXT=orv4prod
export INFRA_API_URL=https://ingress.infraprd.launchpad.objectrocket.cloud/infraapi

# Set up k8s environment...
k8s_export () {
    env=$1
    infra=$2
    # key=$3
    # secret=$4
    # region=$5
    # az_sub=$6
    kubectl config use-context $infra
    unset VAULT_SKIP_VERIFY
    export VAULT_ADDR=https://vault.$env.objectrocket.cloud:1103
    export INFRA_API_URL=https://ingress.$infra.$env.objectrocket.cloud/infraapi
    # export AWS_ACCESS_KEY_ID=$key
    # export AWS_SECRET_ACCESS_KEY=$secret
    # export AWS_DEFAULT_REGION=$region
    set_cluster_aliases
    update_clusters $env
    # az account set -s $az_sub
}
k8s_export_prd () {
    k8s_export launchpad infraprd
}
k8s_export_stg () {
    k8s_export leappad infrastg
}
k8s_export_dev () {
    k8s_export scratchpad infradev
}
# Add all clusters in current environment to ~/.kube/config
update_clusters() {
    echo "update_clusters"
    env=$1
    for cluster in `or-infra cluster get -s active | jq --raw-output .name`
    do
        kubectl config set-cluster $cluster \
        --certificate-authority ~/.kube/certs/$env.ca.crt \
        --server https://k8s-master.$cluster.$env.objectrocket.cloud:6443;
        kubectl config set-context $cluster \
        --cluster $cluster \
        --user $env-stephen.brown
    done
}
# Add aliases for all clusters
set_cluster_aliases() {
    echo "set_cluster_aliases"
    for cluster in `or-infra cluster get -s active | jq --raw-output .name`
    do
        alias "$cluster"="kubectl --context $cluster"
    done
}
# Check on running jobs in infra contexts
joblog() {
  if [ -z "${1}" ]; then
    echo "usage: joblog search-string [context (infraprd|infrastg|infradev)]"
  else
    if [ ! -z "${2}" ]; then
      CONTEXT="--context=${2}"
    else
      CONTEXT="--context=infraprd"
    fi
    COUNT=$(kubectl ${CONTEXT} -n jobs get pods | grep Running | grep ${1} | awk '{ print $1 }' | wc -l)

    if [ $COUNT -lt 1 ]; then
      echo "no Running pods matching ${1}"
    elif [ $COUNT -gt 1 ]; then
      echo "multiple matching running jobs found, be more specific with your search string"
      kubectl ${CONTEXT} -n jobs get pods | grep Running | grep ${1}
    else
      kubectl ${CONTEXT} -n jobs get pods | grep Running | grep ${1} | awk '{ print $1 }' | head -1 | xargs kubectl ${CONTEXT} -n jobs logs -fc main
    fi
  fi
}
