describe CreateDogWalking do
  describe '.call' do
    subject(:result) { described_class.call(params) }

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

    it 'creates a new DogWalking' do
      expect { result }.to change(DogWalking, :count).by(1)
    end

    it 'returns created DogWalking' do
      expect(result.dog_walking).to be_an_instance_of(DogWalking)
    end

    it 'creates an associated address' do
      expect(result.dog_walking.address).to have_attributes(
        id: be_present,
        street: 'Rua Algusta',
        number: '100',
        city: 'São Paulo',
        state: 'SP'
      )
    end

    context 'when an invalid data is given' do
      before { params[:date] = 'aaa' }

      it 'does not create a DogWalking' do
        expect { result }.not_to change(DogWalking, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:date]).to include 'is not a valid datetime'
      end
    end

    context 'when an invalid pets number is given' do
      before { params[:pets] = 'a' }

      it 'does not create a DogWalking' do
        expect { result }.not_to change(DogWalking, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:pets]).to include 'is not a number'
      end
    end

    context 'when less than 1 pets is given' do
      before { params[:pets] = 0 }

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
