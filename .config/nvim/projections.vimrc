let g:projectionist_heuristics = {
    \ "ember-cli-build.js": {
    \   "app/router.js": {"type": "router"},
    \   "app/routes/": {"type": "route"},
    \   "app/routes/*.js": {"type": "route"},
    \   "README.md": {"type": "readme"},
    \   "ember-cli-build.js": {"type": "build"},
    \   "config/environment.js": {"type": "env"},
    \   "app/controllers/": {"type": "controller"},
    \   "app/controllers/*.js": {
    \     "type": "controller",
    \     "alternate": "app/templates/{}.hbs"
    \   },
    \   "app/templates/*.hbs": {
    \    "type":"template",
    \    "alternate":"app/controllers/{}.js"
    \   },
    \   "app/templates/": {"type":"template"},
    \   "app/templates/components/": {"type":"ctemplate"},
    \   "app/templates/components/*.hbs": {
    \     "type": "ctemplate",
    \     "alternate": "app/components/{}.js"
    \   },
    \   "app/components/*.hbs": {
    \     "type": "ctemplate",
    \     "alternate": "app/components/{}.js"
    \   },
    \   "app/components": {"type":"component"},
    \   "app/components/*.js": {
    \     "type":"component",
    \     "alternate": ["app/templates/components/{}.hbs", "app/components/{}.hbs"]
    \   },
    \  },
    \ "mix.exs": {
    \   "README.md": {"type": "readme"},
    \   "mix.exs": {"type": "mix"},
    \   "lib/*.ex": {"type": "lib", "alternate": "test/{}_test.exs"},
    \   "test/": {"type": "test"},
    \   "test/*_test.exs": {"type": "test", "alternate": "lib/{}.ex"},
    \   "lib/**/controllers/*_controller.ex": {"type": "controller" },
    \   "lib/**/channels/*_channel.ex": {"type": "channel"},
    \   "lib/**/templates/*.html.eex": {"type": "template"},
    \   "lib/**/views/*_view.ex": {"type": "view"},
    \   "lib/**/plugs/*.ex": {"type": "plug"},
    \   "config/config.exs": {"type": "config"},
    \   "config/*.exs": {"type": "config"},
    \   "priv/repo/migrations/": {"type": "migration"},
    \   "priv/repo/migrations/*.exs": {"type": "migration"},
    \  }
    \ }
