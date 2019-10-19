describe FinishDogWalking do
  subject(:result) { described_class.call(id: dog_walking.id) }

  let(:dog_walking) { create(:dog_walking, :started) }

  describe '.call', freeze_on: '2019-10-10T10:10:10Z' do
    it 'updates finished_at to current time' do
      expect { result }
        .to change { dog_walking.reload.finished_at }
        .to Time.parse('2019-10-10T10:10:10Z')
    end

    it 'changes state to finished' do
      expect { result }
        .to change { dog_walking.reload.state }.to('finished')
    end

    it { is_expected.to be_success }

    context 'when dog_walking is already finished' do
      let(:dog_walking) { create(:dog_walking, :finished) }

      it { is_expected.not_to be_success }

      it 'does not update finished_at' do
        expect { result }.not_to change { dog_walking.reload.finished_at }
      end

      it 'includes an error message' do
        expect(result.errors[:base]).to include 'is already finished'
      end

      it 'does not change state' do
        expect { result }
          .not_to change { dog_walking.reload.state }
      end
    end

    context 'when dog_walking is not started' do
      let(:dog_walking) { create(:dog_walking) }

      it { is_expected.not_to be_success }

      it 'does not update finished_at' do
        expect { result }.not_to change { dog_walking.reload.finished_at }
      end

      it 'includes an error message' do
        expect(result.errors[:base]).to include 'is not started'
      end

      it 'does not change state' do
        expect { result }
          .not_to change { dog_walking.reload.state }
      end
    end
  end
end
