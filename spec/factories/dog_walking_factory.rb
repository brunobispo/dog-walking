FactoryBot.define do
  factory :dog_walking do
    state { 'scheduled' }
    date { Time.current }
    pets { 2 }
    address
  end
end

