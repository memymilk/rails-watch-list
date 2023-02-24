class BookmarksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @bookmark = Bookmark.new
  end

  def create
    @list = List.find(params[:list_id]) #find the bookmark list
    @bookmark = Bookmark.new(bookmark_params)
    @movie = Movie.find(params[:bookmark][:movie_id]) #find movie from params
    @bookmark.list = @list
    @bookmark.movie = @movie #connect found movie to bookmark
    @bookmark.save!
    if @bookmark.save!
      redirect_to list_path(@list)
      flash[:alert] = "Bravo!"
    end
  end

  def destroy
  @bookmark = Bookmark.find(params[:id])
  @bookmark.destroy
  @list = @bookmark.list
  redirect_to list_path(@list), status: :see_other
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id)
  end
end
