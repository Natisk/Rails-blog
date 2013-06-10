class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index]
  before_filter :current_post, :only => [:update, :destroy, :edit]
  before_filter :all_tags
  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.nothidden.order("created_at desc").page(params[:page]).per(5)
    if user_signed_in?
      @user_posts = current_user.posts.order("created_at desc").limit(5)
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.nothidden.includes([:blog_comments, :tags]).find(params[:id])
    @blog_comment = BlogComment.new
    @user_posts = current_user.posts.order("created_at desc").limit(5)
    @posts = Post.nothidden.order("created_at desc")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = current_user.posts.new(params[:post])
    #@post = Post.unapproved.new
    @posts = current_user.posts
    #@post.user_id = current_user.id
    #@tag = @post.tags.find_or_create_by_tag_word(:tag_word)
    @tag = Tag.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = current_user.posts.new(params[:post])
    @posts = current_user.posts
    #@post.user_id = current_user.id
    #@tag = @post.tags.find_or_create_by_tag_word(:tag_word)

    respond_to do |format|
      if @posts.unapproved.size >= 3
        format.html { redirect_to posts_path, notice: 'You cant post more than 3 unapproved posts' }
      elsif @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  def update
    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private

  def current_post
    @post = current_user.posts.find(params[:id])
  end

  def all_tags
    @tags = Tag.all
  end

end
