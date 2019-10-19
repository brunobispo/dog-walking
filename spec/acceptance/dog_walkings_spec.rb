require 'rspec_api_documentation/dsl'

resource 'Dog Walkings', :vcr do
  header 'Accept', 'application/json'
  header 'Content-Type', 'application/json'

  post '/api/dog_walkings' do
    before do
      Geocoder.configure(lookup: :google,
                         api_key: 'AIzaSyCjeq_oQZyC4N8z1D8PVBjDcAE9rfJYrUQ')
    end

    with_options scope: :dog_walking, with_example: true do
      parameter :pets, 'Number of pets', required: true
      parameter :date, 'Date of order', required: true
      parameter :address_id, 'Customer address id', required: false
      with_options scope: %i[dog_walking address] do
        parameter :street, required: true
        parameter :number, required: true
        parameter :complement, required: false
        parameter :city, required: true
        parameter :state, required: true
      end
    end

    context '200' do
      let(:pets) { 2 }
      let(:date) { '2019-10-10T23:00:00' }
      let(:street) { 'Rua Mario Amaral Barros' }
      let(:number) { '100' }
      let(:city) { 'Limeira' }
      let(:state) { 'SP' }
      let(:raw_post) { params.to_json }

      example_request 'Creating a new walking' do
        response = JSON.parse(response_body, symbolize_names: true)
        expect(status).to eq 200
        expect(response).to eq(
          id: 1,
          date: '2019-10-10T23:00:00.000Z',
          pets: 2,
          state: 'scheduled',
          address: {
            street: 'Rua Mario Amaral Barros',
            number: '100',
            complement: nil,
            city: 'Limeira',
            state: 'SP',
            latitude: '-22.589775',
            longitude: '-47.401124'
          }
        )
      end
    end

    context '422' do
      let(:pets) { 2 }
      let(:date) { '2019-10-10T23:00:00' }
      let(:street) { 'Inexistent st' }
      let(:number) { '100' }
      let(:city) { 'São Paulo' }
      let(:state) { 'SP' }
      let(:raw_post) { params.to_json }

      example_request 'Handling validation errors' do
        response = JSON.parse(response_body, symbolize_names: true)
        expect(status).to eq 422
        expect(response).to eq(errors: { street: ['is invalid'] })
      end
    end
  end

  get '/api/dog_walkings', freeze_on: '2019-10-10T08:00:10Z' do
    parameter :upcoming,
              'Filter upcoming walkings',
              required: false,
              with_example: true

    let!(:future) { create(:dog_walking, date: '2019-10-10T10:10:10Z') }
    let!(:previous) { create(:dog_walking, date: '2019-10-09T10:10:10Z') }

    example_request 'Listing upcoming walkings', upcoming: true do
      response = JSON.parse(response_body, symbolize_names: true)
      expect(status).to eq 200
      expect(response).to eq(
        dog_walkings: [
          {
            id: future.id,
            state: 'scheduled',
            date: '2019-10-10T10:10:10.000Z'
          }
        ]
      )
    end

    example_request 'Listing all walkings' do
      response = JSON.parse(response_body, symbolize_names: true)
      expect(status).to eq 200
      expect(response).to eq(
        dog_walkings: [
          {
            id: previous.id,
            state: 'scheduled',
            date: '2019-10-09T10:10:10.000Z'
          },
          {
            id: future.id,
            state: 'scheduled',
            date: '2019-10-10T10:10:10.000Z'
          }
        ]
      )
    end
  end

  get '/api/dog_walkings/:id' do
    context '200' do
      let(:id) { dog_walking.id }

      let!(:dog_walking) do
        create(:dog_walking,
               address: address,
               pets: 2,
               date: '2019-10-10T23:00:00')
      end

      let(:address) do
        create(:address,
               street: 'Rua Mário Amaral Barros',
               number: '100',
               complement: nil,
               city: 'Limeira',
               state: 'SP',
               latitude: '-22.589775',
               longitude: '-47.401124')
      end

      example_request 'Displaying details of a walking' do
        response = JSON.parse(response_body, symbolize_names: true)
        expect(status).to eq 200
        expect(response).to eq(
          id: dog_walking.id,
          date: '2019-10-10T23:00:00.000Z',
          pets: 2,
          state: 'scheduled',
          address: {
            street: 'Rua Mário Amaral Barros',
            number: '100',
            complement: nil,
            city: 'Limeira',
            state: 'SP',
            latitude: '-22.589775',
            longitude: '-47.401124'
          }
        )
      end
    end

    context '404' do
      let(:id) { 2 }

      example_request 'Looking for an inexistent walking' do
        expect(status).to eq 404
        expect(response_body).to be_empty
      end
    end
  end

  patch '/api/dog_walkings/:id/start_walk' do
    context '200' do
      let(:id) { dog_walking.id }

      let!(:dog_walking) do
        create(:dog_walking,
               address: address,
               pets: 2,
               date: '2019-10-10T23:00:00')
      end

      let(:address) do
        create(:address,
               street: 'Rua Mário Amaral Barros',
               number: '100',
               complement: nil,
               city: 'Limeira',
               state: 'SP',
               latitude: '-22.589775',
               longitude: '-47.401124')
      end

      example_request 'Starting a walking' do
        response = JSON.parse(response_body, symbolize_names: true)
        expect(status).to eq 200
        expect(response).to eq(
          id: dog_walking.id,
          date: '2019-10-10T23:00:00.000Z',
          pets: 2,
          state: 'started',
          address: {
            street: 'Rua Mário Amaral Barros',
            number: '100',
            complement: nil,
            city: 'Limeira',
            state: 'SP',
            latitude: '-22.589775',
            longitude: '-47.401124'
          }
        )
      end
    end

    context '422' do
      let(:id) { dog_walking.id }

      let!(:dog_walking) do
        create(:dog_walking,
               :started,
               address: address,
               pets: 2,
               started_at: '2019-10-10T23:10:00',
               date: '2019-10-10T23:00:00')
      end

      let(:address) do
        create(:address,
               street: 'Rua Mário Amaral Barros',
               number: '100',
               complement: nil,
               city: 'Limeira',
               state: 'SP',
               latitude: '-22.589775',
               longitude: '-47.401124')
      end


      example_request 'Trying to start an started walking' do
        response = JSON.parse(response_body, symbolize_names: true)
        expect(status).to eq 422
        expect(response).to eq(errors: { base: ['is already started'] })
      end
    end
  end

  patch '/api/dog_walkings/:id/finish_walk' do
    context '200' do
      let(:id) { dog_walking.id }

      let!(:dog_walking) do
        create(:dog_walking,
               :started,
               address: address,
               pets: 2,
               date: '2019-10-10T23:00:00')
      end

      let(:address) do
        create(:address,
               street: 'Rua Mário Amaral Barros',
               number: '100',
               complement: nil,
               city: 'Limeira',
               state: 'SP',
               latitude: '-22.589775',
               longitude: '-47.401124')
      end

      example_request 'Finish a walking' do
        response = JSON.parse(response_body, symbolize_names: true)
        expect(status).to eq 200
        expect(response).to eq(
          id: dog_walking.id,
          date: '2019-10-10T23:00:00.000Z',
          pets: 2,
          state: 'finished',
          address: {
            street: 'Rua Mário Amaral Barros',
            number: '100',
            complement: nil,
            city: 'Limeira',
            state: 'SP',
            latitude: '-22.589775',
            longitude: '-47.401124'
          }
        )
      end
    end

    context '422' do
      let(:id) { dog_walking.id }

      let!(:dog_walking) do
        create(:dog_walking,
               :finished,
               address: address,
               pets: 2,
               started_at: '2019-10-10T23:10:00',
               date: '2019-10-10T23:00:00')
      end

      let(:address) do
        create(:address,
               street: 'Rua Mário Amaral Barros',
               number: '100',
               complement: nil,
               city: 'Limeira',
               state: 'SP',
               latitude: '-22.589775',
               longitude: '-47.401124')
      end


      example_request 'Trying to finish an finished walking' do
        response = JSON.parse(response_body, symbolize_names: true)
        expect(status).to eq 422
        expect(response).to eq(errors: { base: ['is already finished'] })
      end
    end
  end
end
