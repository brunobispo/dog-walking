json.extract! dog_walking, :id, :date, :pets
json.address do
  json.extract! dog_walking.address,
                :street,
                :number,
                :complement,
                :city,
                :state,
                :latitude,
                :longitude
end
