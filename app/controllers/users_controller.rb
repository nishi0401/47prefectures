class UsersController < ApplicationController
  before_action :move_to_new_user_session, only: [:show]

  def show
    @user = User.find(params[:id])
    if current_user.id == @user.id
      @records = @user.records.order('prefecture_id ASC')
      prefectures = @records.pluck(:prefecture_id)
      num = prefectures.length
      @achievement_rate = sprintf("%.0f",num / 47.to_f * 100)
    else
      redirect_to new_user_session_path
    end
  end

  private

  def move_to_new_user_session
    return if user_signed_in?

    redirect_to new_user_session_path
  end

end
