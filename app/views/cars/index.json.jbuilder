json.array!(@cars) do |car|
  json.extract! car, :id, :two_door, :year, :make, :model, :vin, :price, :warranty
  json.url car_url(car, format: :json)
end
