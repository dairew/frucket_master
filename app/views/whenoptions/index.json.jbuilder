json.array!(@whenoptions) do |whenoption|
  json.extract! whenoption, :id, :content, :event_id
  json.url whenoption_url(whenoption, format: :json)
end
