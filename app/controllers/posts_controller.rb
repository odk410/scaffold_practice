class PostsController < ApplicationController
  # only에 있는 것에만 find_post를 적용하겠다.
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @post = Post.all.reverse
  end

  def new
  end

  def create

    # Post.create(
    #   title: params[:title],
    #   content: params[:content]
    # )

    # @post = Post.new(
    #   title: params["post"]["title"],
    #   content: params["post"]["content"]
    # )
    @post = Post.create(post_params)

    if @post.save
      redirect_to '/'
    else
      flash[:alert] = "제목과 내용은 필수입력입니다."
      redirect_to :back
    end
  end

  def show

  end

  def edit

  end

  def update
    # @post.update(
    #   title: params[:title],
    #   content: params[:content]
    # )
    @post.update(post_params)
    # redirect_to "/posts/#{@post.id}"
    redirect_to @post
  end

  def destroy
    @post.destroy
    redirect_to '/'
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
