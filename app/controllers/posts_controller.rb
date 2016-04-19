class PostsController < ApplicationController
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





end
