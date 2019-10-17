# == Schema Information
#
# Table name: addresses
#
#  id         :integer          not null, primary key
#  street     :string
#  number     :string
#  complement :string
#  city       :string
#  state      :string
#  latitude   :decimal(, )
#  longitude  :decimal(, )
#

describe Address do
  subject(:address) do
    described_class.new id: 1,
                        street: 'Rua Algusta',
                        number: '1A',
                        complement: 'Apto 61',
                        city: 'São Paulo',
                        state: 'SP'
  end

  it 'has expected attributes' do
    expect(address).to have_attributes(
      id: an_instance_of(Integer),
      street: an_instance_of(String),
      complement: an_instance_of(String),
      city: an_instance_of(String),
      state: an_instance_of(String)
    )
  end
end
