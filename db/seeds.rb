# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

User.delete_all
Link.delete_all
Vote.delete_all

users = User.create([{:email => 'adminguy@email.com',
                      :password => 'letmein',
                      :password_confirmation => 'letmein',
                      :username => 'adminguy'},
                    { :email => 'randomgirl@email.com',
                      :password => 'letmein',
                      :password_confirmation => 'letmein',
                      :username => 'randomgirl' },
                    { :email => 'randomguy@email.com',
                      :password => 'letmein',
                      :password_confirmation => 'letmein',
                      :username => 'randomguy' }])
                      
User.find_by_email('adminguy@email.com').update_attribute(:admin, true)
                      
links = Link.create([{:title => 'These guys copied my website! Should I sue?',
                      :url => 'http://news.ycombinator.com/news',
                      :user_id => users.first.id},
                    { :title => 'I love Bacon!',
                      :url => 'http://en.wikipedia.org/wiki/Francis_Bacon',
                      :user_id => users[1].id },
                    { :title => 'Anyone else know this famous Rails programmer?',
                      :url => 'http://www.facebook.com',
                      :user_id => users[2].id }])
                      
Vote.create([{:user => users.first, :link => links.first, :value => 1},
            {:user => users.first, :link => links[1], :value => -1},
            {:user => users[1], :link => links.first, :value => 1},
            {:user => users[1], :link => links[1], :value => 1},
            {:user => users[2], :link => links.first, :value => -1},
            {:user => users[2], :link => links[2], :value => 1},
            {:user => users[1], :link => links[2], :value => 1},
            {:user => users[0], :link => links[2], :value => 1}])
            

puts "Success!!"                 
