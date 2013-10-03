json.array!(@pastes) do |paste|
  json.extract! paste, :title, :content
  json.url paste_url(paste, format: :json)
end
