class BlogCommentsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]

  def index
    @blog_comments = BlogComment.all.page(params[:page]).per(3)
    respond_to do |format|
      format.html
      format.json {render json: @blog_comments}
    end
  end

  def show
    @blog_comment = BlogComment.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render json: @blog_comment}
    end
  end

  def new
    @blog_comment = BlogComment.new
    respond_to do |format|
      format.html
      format.json {render json: @blog_comment}
    end
  end

  def edit
    @blog_comment = current_user.blog_comments.find(params[:id])
    @post = @blog_comment.post
  end

  def create
    @post = Post.find(params[:post_id])
    @blog_comment = @post.blog_comments.create(params[:blog_comment])
    @blog_comment.user = current_user
    @blog_comment.save
    redirect_to post_path(@post)
  end

  def update
    @blog_comment = current_user.blog_comments.find(params[:id])
    @post = Post.find(params[:post_id])
    respond_to do |format|
      if @blog_comment.update_attributes(params[:blog_comment])
        format.html {redirect_to @post, notice: 'Comment was successfully updated.'}
        format.json {head :no_content}
      else
        format.html {render action: 'edit'}
        format.json {render json: @blog_comment.errors, status: :unprocessable_entity}
      end
    end
  end

  def destroy
    @blog_comment = current_user.blog_comments.find(params[:id])
    @blog_comment.destroy
    respond_to do |format|
      format.html {redirect_to blog_comments_url}
      format.json {head :no_content}
    end
  end

end