describe CreateDogWalking do
  describe '.call' do
    subject(:result) { described_class.call(params) }

    before do
      allow(CreateAddress).to receive(:call)
        .and_return(instance_double(CreateAddress,
                                    success?: true,
                                    address: create(:address)))
    end

    let(:params) do
      {
        date: '2019-01-01T12:00:00',
        pets: 2,
        address: {
          street: 'Rua Algusta',
          number: '100',
          city: 'São Paulo',
          state: 'SP'
        }
      }
    end

    it { is_expected.to be_success }

    it 'creates a new DogWalking' do
      expect { result }.to change(DogWalking, :count).by(1)
    end

    it 'returns created DogWalking' do
      expect(result.dog_walking).to be_an_instance_of(DogWalking)
    end

    context 'when an address_id is provided' do
      let(:existent_address) { create(:address) }

      before { params[:address_id] = existent_address.id }

      it 'associates the provided address' do
        expect(result.dog_walking.address).to eq existent_address
      end
    end

    context 'when address data is provided' do
      it 'creates an associated address' do
        result
        expect(CreateAddress).to have_received(:call).with(params[:address])
      end
    end

    context 'when it is not possible to create an address' do
      before do
        errors = ActiveModel::Errors.new(nil)
        errors.add(:street, 'is wrong')

        allow(CreateAddress).to receive(:call)
          .and_return(instance_double(CreateAddress,
                                      success?: false,
                                      address: nil,
                                      errors: errors))
      end

      it { is_expected.not_to be_success }

      it 'does not create a DogWalking' do
        expect { result }.not_to change(DogWalking, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:street]).to include 'is wrong'
      end
    end

    context 'when an invalid data is given' do
      before { params[:date] = 'aaa' }

      it { is_expected.not_to be_success }

      it 'does not create a DogWalking' do
        expect { result }.not_to change(DogWalking, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:date]).to include 'is not a valid datetime'
      end
    end

    context 'when an invalid pets number is given' do
      before { params[:pets] = 'a' }

      it { is_expected.not_to be_success }

      it 'does not create a DogWalking' do
        expect { result }.not_to change(DogWalking, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:pets]).to include 'is not a number'
      end
    end

    context 'when less than 1 pets is given' do
      before { params[:pets] = 0 }

      it { is_expected.not_to be_success }

      it 'does not create a DogWalking' do
        expect { result }.not_to change(DogWalking, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:pets])
          .to include 'must be greater than or equal to 1'
      end
    end
  end
end
