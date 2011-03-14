require 'faker'

namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => "Example User",
                         :email => "example@railstutorial.org",
                         :password => "foobar",
                         :password_confirmation => "foobar")
    admin.toggle!(:admin)

    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
                   end
                   
       User.all(:limit => 6).each do |user|
          3.times do
            user.concorrentes.create!(:email =>"a@a.com",
                                      :num => Faker::Lorem.sentence(5),
                                      :nome => Faker::Lorem.sentence(5))
          end
    end
    
     Language.create!(:ling=>"C",
                      :compString=>"gcc -Wall -O2 \#{file}",
                      :execString=>"./a.out",
                      :complexExecString=>"./\#{file}")
                      
    Function.create!(:func=>"diff -wiB")
    
  end
end
