server(
    'localhost',
)

set :deploy_to, "/Users/obana.takenori/prac/http"

set :sshkit_backend, SSHKit::Backend::Local
