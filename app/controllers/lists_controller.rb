class ListsController < ApplicationController
  before_action :set_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show
    # smtg
  end

  def new
    @list = List.new
  end

  def edit
    # smtg
  end

  def create
    @list = List.new(list_params)

    if @list.save
      redirect_to @list, notice: 'List was successfully created.'
    else
      render @list.errors, status: :unprocessable_entity
    end
  end

  def update
    if @list.save
      redirect_to @list, notice: 'List was successfully updated.'
    else
      render @list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy!
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:name, :movies, :bookmarks)
  end
end
