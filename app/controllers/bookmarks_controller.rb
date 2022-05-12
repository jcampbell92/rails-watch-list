class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:id])
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = params[:id]
    @bookmark.save
    bookmarks = Bookmark.all
    redirect_to list_path(params[:id])
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    @bookmark.destroy
    redirect_to list_path(@bookmark.list_id)
  end

  private
  def bookmark_params
    params.require(:bookmark).permit(:movie_id, :comment)
  end
end
