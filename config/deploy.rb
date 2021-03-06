set :application, "bloodlines"
set :repository,  "git://github.com/djspinmonkey/bloodlines.git"

# If you aren't deploying to /u/apps/#{application} on the target
# servers (which is the default), you can specify the actual location
# via the :deploy_to variable:
set :deploy_to, "/opt/john/apps/#{application}"

# If you aren't using Subversion to manage your source code, specify
# your SCM below:
set :scm, :git

role :app, "djspinmonkey.com"
role :web, "djspinmonkey.com"
role :db,  "djspinmonkey.com", :primary => true
