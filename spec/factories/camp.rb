FactoryGirl.define do
	factory :camp do
		 name {Faker::Lorem.word}
     fees {Faker::Number.between(300,25000)}
    course "web Development"
    graduation_rate {Faker::Number.between(10,90)}
    employment_rate {Faker::Number.between(10, 90)}
    averge_salary {Faker::Number.between(40000,90000)}
    website  {Faker::Internet.url('example.com')}
    facebook {Faker::Internet.url('facebook.com')}
    twitter  {Faker::Internet.url('twitter.com')}
  end    
end