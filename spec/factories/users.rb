FactoryBot.define do
  sequence :iin do |n|
    n.to_s
  end

  factory :user do
    first_name { "Bill" }
    last_name  { "Gates" }
    iin { generate(:iin) }
    salt 'asdafdasdadsa5646848asdadqwe'
    crypted_password { Sorcery::CryptoProviders::BCrypt.encrypt('secret', salt) }

    trait :admin do
      roles { ['admin'] }
    end
  end
end
