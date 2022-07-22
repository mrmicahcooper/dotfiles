function review-app
  set -l app (curl -s https://api.heroku.com/teams/sfdc-platform-webide/apps -H "Accept: application/vnd.heroku+json; version=3" -H "Authorization: Bearer a91fc330-dfb8-4cee-90db-5c342f1e3b08" | jq -r .[].name | rg codebuilder | fzf)
  # set -l app (heroku pipelines:info codebuilder-platform-api --json | jq -r .apps[].name | fzf)
  bash -c '~/code/codebuilder/api/bin/review_app.sh (app) (argv)'
end

