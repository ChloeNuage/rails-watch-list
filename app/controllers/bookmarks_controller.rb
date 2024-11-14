class BookmarksController < ApplicationController
  before_action :set_bookmark, only: %i[show edit update destroy]
  def index
    @bookmarks = Bookmark.all
  end

  def show
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    # smtg
  end

  def create
    @bookmark = Bookmark.new(list_params)

    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @bookmark.save
      redirect_to @list, notice: 'Bookmark was successfully updated.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def delete
    @bookmark.destroy!
  end

  private

  def set_bookmark
    @list = List.find(params[:list_id])
  end

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie, :list)
  end

end
