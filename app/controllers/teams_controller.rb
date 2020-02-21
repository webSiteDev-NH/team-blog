class TeamsController < ApplicationController
  
  def index
    @teams = Team.all.order(:team_name)
  end

  def show
    @team = Team.find(params[:id])

    # 得点誤差確認 = チーム得点 - 所属選手の総得点
    @total_goal = Post.where(team_id: @team).sum(:goal)
    @player_total_goal = Player.where(team_id: @team).sum(:goals)
    @goals_confirmation = @total_goal - @player_total_goal

    # チェック完了の有無
    @check_confirmation = Post.where(team_id: @team, goals_check: nil).length
    @check_confirmation_datails = Post.where(team_id: @team, goals_check: nil).select(:game_date, :opponent)

    # 試合結果投稿を試合日順に表示
    @posts = @team.posts.page(params[:page]).per(5).order(game_date: :desc)

    # 戦績
    # 全試合
    @total_game = Post.where(team_id: @team)
    @total_win = Post.where(result: "Win", team_id: @team)
    @total_lose = Post.where(result: "Lose", team_id: @team)
    @total_drow = Post.where(result: "Drow", team_id: @team)
    @total_goal = Post.where(team_id: @team).sum(:goal)
    @total_allow = Post.where(team_id: @team).sum(:allow)
    # リーグ戦
    @league = Post.where(team_id: @team, category_id: 1)
    @league_win = Post.where(team_id: @team, category_id: 1, result: "Win")
    @league_lose = Post.where(team_id: @team, category_id: 1, result: "Lose")
    @league_drow = Post.where(team_id: @team, category_id: 1, result: "Drow")
    @league_goal = Post.where(team_id: @team, category_id: 1).sum(:goal)
    @league_allow = Post.where(team_id: @team, category_id: 1).sum(:allow)
    # カップ戦
    @cup = Post.where(team_id: @team, category_id: 2)
    @cup_win = Post.where(team_id: @team, category_id: 2, result: "Win")
    @cup_lose = Post.where(team_id: @team, category_id: 2, result: "Lose")
    @cup_drow = Post.where(team_id: @team, category_id: 2, result: "Drow")
    @cup_goal = Post.where(team_id: @team, category_id: 2).sum(:goal)
    @cup_allow = Post.where(team_id: @team, category_id: 2).sum(:allow)
    # 練習試合
    @practice = Post.where(team_id: @team, category_id: 3)
    @practice_win = Post.where(team_id: @team, category_id: 3, result: "Win")
    @practice_lose = Post.where(team_id: @team, category_id: 3, result: "Lose")
    @practice_drow = Post.where(team_id: @team, category_id: 3, result: "Drow")
    @practice_goal = Post.where(team_id: @team, category_id: 3).sum(:goal)
    @practice_allow = Post.where(team_id: @team, category_id: 3).sum(:allow)
  end

  def affiliation
    @team = Team.find(params[:id])

    # 選手を背番号順に表示
    @players = @team.players.order(number: :asc)
  end

end