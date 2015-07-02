namespace :deploy do
  desc "Deploy production application"
  task :production => :environment do
    system 'heroku maintenance:on | heroku ps:scale worker=0'
    system 'git push heroku master'
    system "heroku run 'cp config/database.yml.sample config/database.yml | rake db:migrate'"
    system 'heroku maintenance:off | heroku ps:scale worker=1'
  end
end