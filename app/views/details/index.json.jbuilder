json.array!(@details) do |detail|
  json.extract! detail, :id, :title
  json.url detail_url(detail, format: :json)
end
