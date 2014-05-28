class PostsController < ApplicationController

  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :current_post, :only => [:update, :destroy, :edit]
  before_filter :all_tags

  def index
    @posts = Post.nothidden.approved.order("created_at desc").page(params[:page]).per(5)
    if user_signed_in?
      @user_posts = current_user.posts.order("created_at desc").limit(5)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def show
    unless user_signed_in?
      @post = Post.nothidden.approved.includes([:blog_comments, :tags]).find(params[:id])
    else
      @post = Post.nothidden.includes([:blog_comments, :tags]).find(params[:id])
      @user_posts = current_user.posts.order("created_at desc").limit(5)
    end
    @blog_comment = BlogComment.new
    @posts = Post.nothidden.order("created_at desc")

    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def new
    @post = current_user.posts.new(params[:post])
    @posts = current_user.posts
    @tag = Tag.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  def edit
  end

  def create
    @post = current_user.posts.new(params[:post])
    @posts = current_user.posts
    @tag = Tag.new

    respond_to do |format|
      if @posts.unapproved.count >= 3
        format.html { redirect_to posts_path, notice: 'You cant post more than 3 unapproved posts' }
      elsif @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: 'new' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Your post was deleted' }
      format.json { head :no_content }
    end
  end

  private

    def current_post
      @post = current_user.posts.find(params[:id])
    end

    def all_tags
      @tags = Tag.joins(:posts).uniq
    end

end
