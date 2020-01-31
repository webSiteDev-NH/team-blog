class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
    @posts = Post.order(created_at: :desc).page(params[:page]).per(5)
  end

end