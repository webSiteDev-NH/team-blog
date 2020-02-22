class PlayersController < ApplicationController

  before_action :player_find, only: [:show, :edit, :update, :destroy]
  before_action :return_top_page, except: [:index, :show]


  def index
    # 得点ランキング
    @players = Player.all.includes(:team).order(goals: :desc).order(name: :desc)
    # １位
    @first_scorer = @players.first
    # ２位
    @second_scorer = @players.second
    # ３位
    @third_scorer = @players.third
    # ４位〜７位
    @low_scorer = @players.limit(7).offset(3)
  end

  def show
  end

  def new
    @player = Player.new
    @team = current_team.id
  end

  def create
    @player = Player.new(profile_params)
    @team = current_team.id
    if @player.save
      redirect_to affiliation_team_path(@team), notice:"登録できました"
    else
      render :new, alert:"登録できませんでした"
    end
  end

  def edit
    @team = @player.team
  end

  def update
    if @player.update(profile_params)
      # プロフィール画像削除
      @player.remove_image!
      redirect_to @player, notice:"編集できました"
    else
      render :edit, aleat:"編集できませんでした"
    end
  end

  def destroy
    @team = current_team.id
    if @player.destroy
      redirect_to affiliation_team_path(@team), notice:"削除できました"
    else
      render :edit, aleat:"削除できませんでした"
    end
  end

  private

  def player_find
    @player = Player.find(params[:id])
  end

  def profile_params
    params.require(:player).permit(:name, :number, :position, :birthday, :height, :weight, :goals, :play_style, :image, :remove_image).merge(team_id: current_team.id)
  end

  def return_top_page
    redirect_to controller: 'posts', action: :index unless team_signed_in?
  end

end
