# == Schema Information
#
# Table name: dog_walkings
#
#  id          :integer          not null, primary key
#  state       :string
#  date        :datetime
#  started_at  :datetime
#  finished_at :datetime
#  pets        :integer
#  address_id  :integer          not null
#

describe DogWalking do
  subject(:dog_walking) do
    described_class.new id: 1,
                        state: 'finished',
                        date: '2019-01-01T12:00:00',
                        started_at: '2019-01-01T12:03:00',
                        finished_at: '2019-01-01T13:00:00',
                        pets: 2,
                        address: build_stubbed(:address)
  end

  it 'has expected attributes' do
    expect(dog_walking).to have_attributes(
      id: an_instance_of(Integer),
      state: an_instance_of(String),
      date: an_instance_of(ActiveSupport::TimeWithZone),
      started_at: an_instance_of(ActiveSupport::TimeWithZone),
      finished_at: an_instance_of(ActiveSupport::TimeWithZone),
      pets: an_instance_of(Integer),
      address: an_instance_of(Address)
    )
  end
end
