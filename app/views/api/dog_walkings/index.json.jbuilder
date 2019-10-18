json.dog_walkings do
  json.array! @result do |dog_walking|
    json.id dog_walking.id
    json.date dog_walking.date
    json.state dog_walking.state
  end
end
