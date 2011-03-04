# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

users = User.create([{:email => 'adminguy@email.com',
                      :password => 'letmein',
                      :password_confirmation => 'letmein',
                      :username => 'adminguy'},
                    { :email => 'randomuser@email.com',
                      :password => 'letmein',
                      :password_confirmation => 'letmein',
                      :username => 'randomuser'}])
                      
links = Link.create([{:title => 'This guy copied me!',
                      :url => 'http://www.reddit.com',
                      :user_id => users.first},
                    { :title => 'Has anybody tried this new language?',
                      :url => 'http://tryruby.org/',
                      :user_id => users[1]}])
                      
Vote.create([{:user => users.first, :link => links.first, :value => 1},
            {:user => users.first, :link => links[1], :value => -1},
            {:user => users[1], :link => links.first, :value => 1}])
                      
