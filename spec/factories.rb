FactoryGirl.define do

  factory :user do
    name 'Marc'
    email 'bluemner@yahoo.de'
  end

  factory :job_offer do
    title Faker::Job.title
    location Faker::Address.city
    description Faker::Lorem.sentence
    contact Faker::Internet.email
    time_start  Time.now
    time_end  Time.now + (2*60*60)
  end
end
