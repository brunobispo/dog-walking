describe StartDogWalking do
  subject(:result) { described_class.call(id: dog_walking.id) }

  let(:dog_walking) { create(:dog_walking) }

  describe '.call', freeze_on: '2019-10-10T10:10:10Z' do
    it 'updates started_at to current time' do
      expect { result }
        .to change { dog_walking.reload.started_at }
        .to Time.parse('2019-10-10T10:10:10Z')
    end

    it { is_expected.to be_success }

    it 'changes state to started' do
      expect { result }
        .to change { dog_walking.reload.state }.to('started')
    end

    context 'when dog_walking is already started' do
      let(:dog_walking) { create(:dog_walking, :started) }

      it { is_expected.not_to be_success }

      it 'does not update started_at' do
        expect { result }.not_to change { dog_walking.reload.started_at }
      end

      it 'includes an error message' do
        expect(result.errors[:base]).to include 'is already started'
      end

      it 'does not change state' do
        expect { result }
          .not_to change { dog_walking.reload.state }
      end
    end
  end
end
