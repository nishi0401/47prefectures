class DestinationsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    records = @user.records
    prefectures = records.pluck(:prefecture_id)
    all_numbers = (1..47).to_a
    remaining_numbers = all_numbers - prefectures
    random_number = remaining_numbers.sample
    @random_data = Prefecture.find(random_number)
  end
end
