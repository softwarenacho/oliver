class PostsController < ApplicationController

  def post
    @post = Post.new
    p params[:type]
    @type = params[:type]
    p params
  end

  def create
    @user = current_user
    @post = Post.create(title: params[:post][:title], content: params[:post][:content], user_id: @user.id, kind: params[:post][:kind])
  end

end
