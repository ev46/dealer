json.array!(@offers) do |offer|
  json.extract! offer, :id, :car_id, :email, :amount, :created_at, :rejected
  json.url offer_url(offer, format: :json)
end