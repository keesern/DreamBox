json.array!(@dreams) do |dream|
  json.extract! dream, :id, :description, :start_time
  json.url dream_url(dream, format: :json)
end
