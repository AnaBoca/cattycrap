FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "dummyEmail#{n}@gmail.com"
    end
    password { "secretPassword" }
    password_confirmation { "secretPassword" }
  end

  factory :event do
    vaccine_type { "Rabies" }
    date { Date.today }
    notes { "For Fluffy. 2-years-of-age Rabies vaccine. Will need to use Fear Free kit prior to appt."}
    
    association :user
  end
end