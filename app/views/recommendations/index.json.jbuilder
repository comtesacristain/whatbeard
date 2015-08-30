json.array!(@recommendations) do |recommendation|
  json.extract! recommendation, :id
  json.url recommendation_url(recommendation, format: :json)
end
