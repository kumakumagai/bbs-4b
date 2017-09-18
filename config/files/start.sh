bin/rails db:create RAILS_ENV=production
bin/rails db:migrate RAILS_ENV=production
bin/rake db:seed RAILS_ENV=production
export SECRET_KEY_BASE=`bin/rake secret`
bin/rake assets:precompile RAILS_ENV=production
mkdir run
rails s -e production