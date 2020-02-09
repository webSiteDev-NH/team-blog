json.array! @posts do |post|
  json.id post.id
  json.team_id post.team_id
  json.category_id post.category_id
  json.game_date post.game_date
  json.category post.category.name
  json.opponent post.opponent
  json.team_name post.team.team_name
  json.result post.result
  json.goal post.goal
  json.allow post.allow
  json.team_sign_in current_team
end