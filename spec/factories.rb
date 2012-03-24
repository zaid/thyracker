FactoryGirl.define do

  sequence :email do |n|
    "joe-#{n}@tester.ca"
  end

  factory :sample do
    taken_on	"2012-03-08"
    tsh		4.4
    t3		2.1
    t4		5.6
  end

  factory :user do
    first_name            'Joe'
    last_name             'Tester'
    email                 { FactoryGirl.generate(:email) }
    password              'secret'
    password_confirmation 'secret'
  end
end
