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

  describe '#state' do
    it 'is "scheduled" by default' do
      expect(DogWalking.new).to have_attributes(state: 'scheduled')
    end
  end

  describe '#started?' do
    context 'when started_at is present' do
      before { dog_walking.started_at = Time.current }

      it { is_expected.to be_started }
    end

    context 'when started_at is empty' do
      before { dog_walking.started_at = nil }

      it { is_expected.not_to be_started }
    end
  end

  describe '#finished?' do
    context 'when finished_at is present' do
      before { dog_walking.finished_at = Time.current }

      it { is_expected.to be_finished }
    end

    context 'when finished_at is empty' do
      before { dog_walking.finished_at = nil }

      it { is_expected.not_to be_finished }
    end
  end

  describe '#duration' do
    context 'when is not started' do
      subject(:dog_walking) { build_stubbed(:dog_walking) }

      it 'is nil' do
        expect(dog_walking.duration).to be_nil
      end
    end

    context 'when is not finished', freeze_on: '2019-10-10T10:10:00Z' do
      subject(:dog_walking) do
        build_stubbed(:dog_walking,
                      :started,
                      started_at: '2019-10-10T10:00:00Z')
      end

      it 'is the difference from started_at to current time' do
        expect(dog_walking.duration).to eq 10.minutes
      end
    end

    context 'when is finished' do
      subject(:dog_walking) do
        build_stubbed(:dog_walking,
                      :finished,
                      started_at: '2019-10-10T10:00:00Z',
                      finished_at: '2019-10-10T10:50:00Z')
      end

      it 'is the difference from started_at to finished_at' do
        expect(dog_walking.duration).to eq 50.minutes
      end
    end
  end

  describe '#price' do
    context 'when is not started' do
      subject(:dog_walking) { build_stubbed(:dog_walking) }

      it 'is nil' do
        expect(dog_walking.price).to be_nil
      end
    end

    context 'when duration is 30 minutes' do
      subject(:dog_walking) do
        build_stubbed(:dog_walking,
               :finished,
               pets: 1,
               started_at: '2019-10-10T10:00:00Z',
               finished_at: '2019-10-10T10:30:00Z')
      end

      it 'costs R$ 25,00' do
        expect(dog_walking.price).to eq 25.0
      end

      it 'costs more R$15,00 for +1 pet' do
        dog_walking.pets = 2
        expect(dog_walking.price).to eq 40.0
      end
    end

    context 'when duration is 60 minutes' do
      subject(:dog_walking) do
        build_stubbed(:dog_walking,
                      :finished,
                      pets: 1,
                      started_at: '2019-10-10T10:00:00Z',
                      finished_at: '2019-10-10T11:00:00Z')
      end

      it 'costs R$ 35,00' do
        expect(dog_walking.price).to eq 35.0
      end

      it 'costs more R$20,00 for +1 pet' do
        dog_walking.pets = 2
        expect(dog_walking.price).to eq 55.0
      end
    end
  end
end
