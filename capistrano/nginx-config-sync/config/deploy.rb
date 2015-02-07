lock '3.1.0'

set :application,     'name'
set :repo_url,        'git@example.com'
set :scm_verbose,     true
set :use_sudo,        true
set :pty,             true
set :ssh_options,     {
  user: 'deploy',
  keys: [File.join(File.dirname(__FILE__), '..', '.ssh', 'id_rsa')]
}
set :linked_dirs,     %w(
  public/htdocs/files
)

namespace :x do
  after 'deploy',     'nginx:site:add'
  after 'deploy',     'nginx:site:enable'
  after 'deploy',     'nginx:reload'
end
