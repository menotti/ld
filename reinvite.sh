#!/usr/bin/env bash

# Verifica argumento
if [ -z "$1" ]; then
  echo "Uso: $0 <prefixo-da-atividade>"
  exit 1
fi

ORG="DC-UFSCar"
PREFIX="$1"

gh repo list "$ORG" --limit 1000 --json name \
| jq -r '.[].name | select(startswith("'"$PREFIX"'"))' \
| while read repo; do
  full="$ORG/$repo"

  echo -e "\t $full"

  gh api "repos/$full/invitations" \
  | jq -r '.[] | "\(.id),\(.invitee.login)"' \
  | while IFS=',' read id user; do
    echo "Resetando convite de $user em $repo"

    # remove convite antigo
    gh api "repos/$full/invitations/$id" -X DELETE

    # recria convite
    gh api "repos/$full/collaborators/$user" -X PUT -f permission=write 1> /dev/null
  done
done

