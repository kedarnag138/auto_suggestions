class Api::V1::UsersController < ApplicationController

  def index
    @users = User.all
    render json: @users
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      render json: { status: 200, error_detail: '', message: 'OK' }
    else
      render json: { status: 422, error_detail: @user.errors.full_messages.first, message: 'VALIDATION FAILED' }
    end
  end

  def suggestions
    results = AutoSuggestionService.new(params[:query]).call
    render json: results
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :description)
  end

end