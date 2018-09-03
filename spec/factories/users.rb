FactoryBot.define do
  sequence :iin do |n|
    n.to_s
  end

  factory :user do
    first_name { "Bill" }
    last_name  { "Gates" }
    iin { generate(:iin) }
    # admin { false }
  end
end
