# shellcheck disable=SC2164
PWD="$( pwd -P )"
ROOT="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

cd ${ROOT}

for tag in *; do
  echo "Scan ${tag} ..."
  [[ -d "${tag}" ]] \
  && echo "Push ${tag} ..." \
  && cd ${ROOT}/${tag} \
  && docker build . -t cvvnx1/grok_exporter:${tag} \
  && docker push cvvnx1/grok_exporter:${tag} \
  && cd ${ROOT}
done

cd ${PWD}
