let g:projectionist_heuristics = {
    \ "mix.exs": {
    \   "README.md": {"type": "readme"},
    \   "lib/*.ex": {"type": "lib", "alternate": "test/{}_test.exs"},
    \   "test/": {"type": "test"},
    \   "test/support/*.ex": {"type": "support"},
    \   "test/support": {"type": "support"},
    \   "test/*_test.exs": {"type": "test", "alternate": "lib/{}.ex"},
    \   "lib/**/controllers/*_controller.ex": {
    \     "type": "controller",
    \     "template": [
    \       "defmodule {camelcase|capitalize|dot}Controller do",
    \       "  use {dirname|camelcase|capitalize}, :controller",
    \       "",
    \       "end"
    \     ]
    \   },
    \   "lib/**/channels/*_channel.ex": {"type": "channel"},
    \   "lib/**/templates/": {"type": "template"},
    \   "lib/**/templates/layout/": {"type": "layout"},
    \   "lib/**/templates/*.html.heex": {"type": "template"},
    \   "lib/**/templates/layout/*.html.heex": {"type": "layout"},
    \   "lib/**/views/": { "type":"view" },
    \   "lib/**/views/*_view.ex": {
    \     "type": "view",
    \     "template": [
    \       "defmodule {camelcase|capitalize|dot}View do",
    \       "  use {dirname|camelcase|capitalize}, :view",
    \       "",
    \       "end"
    \     ]
    \   },
    \   "lib/**/plugs/*.ex": {"type": "plug"},
    \   "lib/**/plugs/": {"type": "plug"},
    \   "lib/**_web/*.ex": {"type": "web"},
    \   "lib/**/endpoint.ex": {"type": "endpoint"},
    \   "config/config.exs": {"type": "fig"},
    \   "config/*.exs": {"type": "fig"},
    \   "priv/repo/migrations/": {"type": "migration"},
    \   "priv/repo/migrations/*.exs": {"type": "migration"},
    \  },
    \}
