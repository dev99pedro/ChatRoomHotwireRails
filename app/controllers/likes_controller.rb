class LikesController < ApplicationController
  before_action :set_post, only: [ :create, :destroy ]


  def create
    @like = @post.likes.new(user: current_user)
    if @like.save
      flash.now[:notice] = "Você curtiu o post!"  # Use 'flash.now' para exibir a mensagem sem recarregar

    else
      flash.now[:alert] = "Erro ao curtir o post!"  # Use 'flash.now' aqui também

    end
  end


  def set_post
    @post = Post.find(params[:post_id])
  end


  def destroy
    @like = @post.likes.find_by(user: current_user)
    if @like
      @like.destroy
      flash[:notice] = "Você descurtiu o post!"
    else
      flash[:alert] = "Erro ao descurtir o post!"
    end
  end
end
