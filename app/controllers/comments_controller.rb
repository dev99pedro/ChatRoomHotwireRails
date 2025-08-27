class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])  # Busca o post pelo ID
    @comment = @post.comments.build(comment_params)  # Cria o comentário associado ao post
    @comment.user_id = current_user.id  # Associa o comentário ao usuário logado

    if @comment.save
      # Comentário salvo com sucesso, redireciona para a página do post

      redirect_to post_path(@post), notice: "Comentário criado com sucesso!"
    else
      # Caso não salve, redireciona de volta para o post com uma mensagem de erro
      redirect_to post_path(@post), alert: "Erro ao criar comentário!"
    end
  end



  private

  def comment_params
    params.require(:comment).permit(:comments)  # Permite o conteúdo do comentário, que deve ser 'comments' no banco
  end
end
