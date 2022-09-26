json.data do
  json.array! @tags, partial: "api/v1/projects/tags/tag", as: :tag
end

render_pagination(json)
