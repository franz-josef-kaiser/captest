set :application, "your-application-name"
set :repository, "git@github.com:you/your-project.git"
set :scm, :git
set :deploy_to, "/home/path/to/project/"

set :deploy_via, :remote_cache
set :copy_exclude, [".git", ".DS_Store", ".gitignore", ".gitmodules"]

server "example.org", :app