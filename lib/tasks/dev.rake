namespace :dev do

  task :fake => :environment do
    users = []
    10.times do
      users << User.create!( :username => Faker::Name.unique.name ,:email => Faker::Internet.unique.email, :password => "12345678")
    end

    50.times do |i|
      post = Post.create!(  :title => Faker::Lorem.sentence,
                            :content => Faker::Lorem.paragraph,
                            :user_id => users.sample.id )

    end
  end

end