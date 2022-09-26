json.data do
  json.array! @projects, partial: "api/v1/projects/project", as: :project
end

render_pagination(json)
