# shellcheck disable=SC2164
ROOT="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

for tag in *; do
  [[ -d "${tag}" ]] \
  && cd ${ROOT}/${tag} \
  && docker build . -t cvvnx1/grok_exporter:${tag} \
  && docker push cvvnx1/grok_exporter:${tag}
done