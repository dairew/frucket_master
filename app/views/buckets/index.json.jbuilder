json.array!(@buckets) do |bucket|
  json.extract! bucket, :id, :title, :description
  json.url bucket_url(bucket, format: :json)
end
