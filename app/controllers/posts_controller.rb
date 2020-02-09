class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :select_category, only: [:new, :create, :edit, :update]
  before_action :return_top_page, except: [:index, :show, :search]


  def index
    @posts = Post.order(game_date: :desc).includes(:team).page(params[:page]).per(5)
  end

  def search
    @posts = Post.search(params[:keyword]).order(game_date: :desc).page(params[:page]).per(5)
    respond_to do |format|
      format.html
      format.json
    end
  end

  def show
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post, notice: '作成できました'
    else
      render :new, alert: '作成できませんでした'
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: '更新できました'
    else
      render :edit, alert: '更新できませんでした'
    end
  end

  def destroy
    if @post.destroy
      redirect_to root_path, notice: '削除しました'
    else
      redirect_to root_path, notice: '削除できませんでした'
    end
  end

  private
  
  def find_post
    @post = Post.find(params[:id])
  end

  def select_category
    @category = Category.all
  end

  def post_params
    params.require(:post).permit(:opponent,:result,:goal,:allow,:scorer,:commentary, :game_date, :category_id, :video).merge(team_id: current_team.id)
  end

  def return_top_page
    redirect_to action: :index unless team_signed_in?
  end

end

#データベース(カラム名)
#opponent（対戦相手）,result（結果）,goal（得点）,allow（失点）,scorer（得点者）,commentary（戦評）,game_date(試合日)