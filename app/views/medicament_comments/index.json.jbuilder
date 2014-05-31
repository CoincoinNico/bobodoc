json.array!(@medicament_comments) do |medicament_comment|
  json.extract! medicament_comment, :id, :title, :review, :references
  json.url medicament_comment_url(medicament_comment, format: :json)
end
