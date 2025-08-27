class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_post, only: [ :edit, :update ]

  def index
    @post = Post.all
    @user = current_user.email
  end

  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id


    if @post.save
      redirect_to root_path, notice: "Post criado"
    else
        redirect_to root_path, notice: "error to create post"
    end
  end


  def show
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:title, :description)
  end

  def set_post
    @post = Post.find(params[:id])
  end


  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)
    redirect_to root_path, notice: "atualizado"
  end
end
