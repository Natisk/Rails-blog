class TagsController < ApplicationController

  def index
    @tags = Tag.joins(:posts)

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @tag = Tag.new
  end

  def create

  end

  def show
    @tag = Tag.find(params[:id])
  end

  def update

  end


end
