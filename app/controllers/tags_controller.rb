class TagsController < ApplicationController

  def index
    @tags = Tag.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  def new
    @tags = Tag.new
  end

  def create
    @tags = Tag.new(params[:tag_word])
  end

end
