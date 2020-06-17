class TagsController < ApplicationController
  def index
    @tags = Tag.all
  end

  def show
    @tag = Tag.find(params[:id])
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tagging = Tagging.find(@tag[:id])
    @tagging.destroy
    @tag.destroy
    flash.notice = "Tag '#{@tag.name}' Deleted!"
    redirect_to tags_path
  end
end
