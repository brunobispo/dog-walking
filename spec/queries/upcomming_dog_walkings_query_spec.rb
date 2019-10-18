describe UpcommingDogWalkingsQuery do
  subject(:query) { described_class.call }

  let!(:upcoming_walkings) { create_list(:dog_walking, 3, date: 2.days.from_now) }
  let!(:previous_walkings) { create_list(:dog_walking, 3, date: 2.days.ago) }

  describe '.call' do
    it { is_expected.to eq upcoming_walkings }
  end
end
