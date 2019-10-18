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
        expect(status).to eq 200
        expect(JSON.parse(response_body)).to eq(
          'id' => 1,
          'date' => '2019-10-10T23:00:00.000Z',
          'pets' => 2,
          'address' => {
            'street' => 'Rua Mario Amaral Barros',
            'number' => '100',
            'complement' => nil,
            'city' => 'Limeira',
            'state' => 'SP',
            'latitude' => '-22.589775',
            'longitude' => '-47.401124'
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
        expect(status).to eq 422
        expect(JSON.parse(response_body)).to eq(
          'message' => 'Validation failed',
          'errors' => {
            'street' => ['is invalid']
          }
        )
      end
    end

    get '/api/dog_walkings' do
      parameter :upcoming,
                'Filter upcoming walkings',
                required: false,
                with_example: true
    end

    get '/api/dog_walkings/:id' do
    end

    patch '/api/dog_walkings/:id/start_walk' do
    end

    patch '/api/dog_walkings/:id/finish_walk' do
    end
  end
end
