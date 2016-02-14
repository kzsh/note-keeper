json.notes do
  json.array!(notes) do |note|
    json.(
      note,
      :id,
      :title,
      :link,
      :comment
    )
  end
end
