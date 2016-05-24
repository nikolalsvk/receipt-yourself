FactoryGirl.define do

  factory :user do
    name "John"
    nickname "Doe"
    email "john@doe.com"
    password "iamjohndoenigga"
    password_confirmation "iamjohndoenigga"

    factory :confirmed_user do
      confirmed_at Time.zone.now
    end
  end

end
