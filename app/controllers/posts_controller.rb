class PostsController < ApplicationController

  before_action :set_post, only: [:edit, :edit, :update, :destroy]

  def index
    @posts = Post.insert_author.online(true).for_user(current_user.id).order(id: :desc).all
  end

  def show
    @post = Post.find(params[:id])
  end

  def all
    @posts = Post.insert_author.online(true).order(updated_at: :desc).all
  end

  def new
    @post = Post.new
  end

  def create
    puts "\n\n\n\n\n\n\n #{params}"
    @post = Post.new(get_params)
    @post.user_id = current_user.id
    if(@post.valid?)
      @post.save
      RegisterMailer.post_confirm(current_user, @post).deliver_now
      redirect_to posts_path, success: "Publication créé avec succes"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @post.update(get_params)
      redirect_to posts_path, success: "Publication mise à jour avec succes"
    else
      render 'edit'
    end
  end

  def to_favorite
    @post = Post.find(params[:id])
    if @post.present?
      current_user.posts << @post unless current_user.posts.include?(@post)
      puts 'ajouter'
    end
    redirect_to root_path
  end

  def favorites
    @favorites = current_user.posts
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


  private
  def set_post
    @post = Post.find(params[:id])
  end

  def get_params
    params.require(:post).permit(:content, :image, :image_cache)
  end
end
