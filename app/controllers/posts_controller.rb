class PostsController < ApplicationController

  before_action :find_post, only: [:show, :edit, :update, :destroy]

  # Gathering active categories to attach to category to create or update
  before_action :gather_category, only: [:new, :edit]


  def index
    @posts= Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @cpost = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end


  private

  # Avoid paramters hacking
  def post_params
    #params.require(:post).permit(xxxxxxxxxx)
  end

  def find_post
    @post = Post.find(params[:id])
  end

  def gather_category
    @selectable_categories = Category.active
  end





end
