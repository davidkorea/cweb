class PostsController < ApplicationController

  before_action :authenticate_user!, :only => [:new, :create]


  def new
    @ccase = Ccase.find(params[:ccase_id])
    @post = Post.new
  end


  def create
    @ccase = Ccase.find(params[:ccase_id])
    @post = Post.new(post_params)
    @post.ccase = @ccase
    @post.user = current_user

    if @post.save
      redirect_to ccase_path(@ccase)
    else
      render :new
    end
  end




  private

  def post_params
    params.require(:post).permit(:content)
  end

end
