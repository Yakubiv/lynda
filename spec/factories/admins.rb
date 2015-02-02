FactoryGirl.define do
	factory :admin do
		sequence(:email) {|n| "person#{n}@example.com" }
	    password 'password'	
	end
end