FactoryGirl.define do

  sequence :email do |n|
    "joe-#{n}@tester.ca"
  end

  factory :user do
    first_name            'Joe'
    last_name             'Tester'
    email                 { FactoryGirl.generate(:email) }
    password              'secret'
    password_confirmation 'secret'
  end

  factory :sample do
    taken_on	DateTime.now
    tsh		4.4
    t3		2.1
    t4		5.6
    user
  end
end
