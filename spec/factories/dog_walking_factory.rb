# == Schema Information
#
# Table name: dog_walkings
#
#  id          :integer          not null, primary key
#  state       :string           default("scheduled")
#  date        :datetime
#  started_at  :datetime
#  finished_at :datetime
#  pets        :integer
#  address_id  :integer          not null
#

FactoryBot.define do
  factory :dog_walking do
    state { 'scheduled' }
    date { Time.current }
    pets { 2 }
    address

    trait :started do
      started_at { 2.day.ago }
    end

    trait :finished do
      started
      finished_at { 1.day.ago }
    end
  end
end

