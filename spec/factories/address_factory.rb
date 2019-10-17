# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string
#  number     :string
#  complement :string
#  city       :string
#  state      :string
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#

FactoryBot.define do
  factory :address do
    street { Faker::Address.street_name }
    number { Faker::Address.building_number }
    complement { Faker::Address.secondary_address }
    city { Faker::Address.city }
    state { Faker::Address.state_abbr }
  end
end
