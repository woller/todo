json.data do
  json.array! @goals, partial: "api/v1/goals/goal", as: :goal
end

render_pagination(json)
