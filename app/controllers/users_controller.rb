class UsersController < ApplicationController
  skip_before_action :authorize_request, only: %i[create check_email reset_password]
  before_action :set_me, only: %i[my_profile]
  before_action :set_user, only: %i[show]

  def my_profile
    json_response(@user.data.to_json)
  end

  def show
    json_response(@user.data.to_json)
  end

  def create
    @user = User.new(user_params)
    @user.save
    json_response(@user.data.to_json, 201)
  end

  def update
    @user = User.update(user_params)
    json_response(@user.data.to_json)
  end

  def change_password
    @user = User.change_password(change_password_params)
    json_response(@user.data.to_json)
  end

  def check_email
    @user = User.check_email(email_params[:user])
    json_response(@user.data.to_json)
  end

  def reset_password
    @user = User.reset_password(email_params)
    json_response(@user.to_json)
  end

  private

  def user_params
    params.permit(
      user: [
        :first_name,
        :last_name,
        :email,
        :password,
        :image_url
      ]
    )
  end

  def change_password_params
    params.permit(
      user: [
        :current_password,
        :new_password
      ]
    )
  end

  def email_params
    params.permit(
      user: [:email]
    )
  end

  def set_me
    @user = User.find_me
  end

  def set_user
    @user = User.find(params[:id])
  end
end
