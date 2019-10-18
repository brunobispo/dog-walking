describe CreateAddress do
  describe '.call', :vcr do
    subject(:result) { described_class.call(params) }

    before do
      Geocoder.configure(lookup: :google,
                         api_key: 'AIzaSyCjeq_oQZyC4N8z1D8PVBjDcAE9rfJYrUQ')
    end

    let(:params) do
      {
        street: 'Rua Álvaro de Carvalho',
        number: '205',
        city: 'São Paulo',
        state: 'SP'
      }
    end

    it { is_expected.to be_success }

    it 'creates a new Address' do
      expect { result }.to change(Address, :count).by(1)
    end

    it 'returns created Address' do
      expect(result.address).to be_an_instance_of(Address)
    end

    it 'finds address coordinates' do
      expect(result.address).to have_attributes(
        latitude: be_present,
        longitude: be_present
      )
    end

    context 'when is provided an inexistent street' do
      before { params[:street] = 'Inexistent street' }

      it { is_expected.not_to be_success }

      it 'does not create an Address' do
        expect { result }.not_to change(Address, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:street]).to include 'is invalid'
      end
    end

    context 'when a blank street name is given' do
      before { params[:street] = '' }

      it { is_expected.not_to be_success }

      it 'does not create an Address' do
        expect { result }.not_to change(Address, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:street]).to include "can't be blank"
      end
    end

    context 'when a blank city name is given' do
      before { params[:city] = '' }

      it { is_expected.not_to be_success }

      it 'does not create an Address' do
        expect { result }.not_to change(Address, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:city]).to include "can't be blank"
      end
    end

    context 'when a state acronym has length smaller than 2' do
      before { params[:state] = 'A' }

      it { is_expected.not_to be_success }

      it 'does not create an Address' do
        expect { result }.not_to change(Address, :count)
      end

      it 'includes an error message' do
        expect(result.errors[:state])
          .to include 'is the wrong length (should be 2 characters)'
      end
    end
  end
end
