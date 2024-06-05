class RecordsController < ApplicationController
  def index
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to record_path(@record.id)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    record = Record.find(params[:id])
    if current_user.id == record.user.id
      record.destroy
      redirect_to user_path(current_user.id)
    else
      redirect_to action: :index
    end
  end

  private

  def record_params
    params.require(:record).permit(:image, :content, :prefecture_id).merge(user_id: current_user.id)
  end
end
