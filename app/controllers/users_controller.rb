class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  skip_before_action :authorize_request, only: :create

  def index
    @users = User.all
    json_response(@users)
  end

  # POST /signup
  def create
    user = User.create!(user_params)
    auth_token = AuthenticateUser.new(user.email, user.password).call
    response = { message: Message.account_created, auth_token: auth_token }
    json_response(response, :created)
  end

  # GET /users/:id
  def show
    json_response(@user)
  end

  # UPDATE /users/:id
  def update
    @user.update(change_permission)
    head :no_content
  end

  # DELETE /users/:id
  def destroy
    @user.destroy
    head :no_content
  end

  private

  def user_params
    params.permit(
      :name,
      :email,
      :password,
      :password_confirmation,
      :role
    )
  end

  def change_permission
    params.permit(:role)
  end

  def set_user
    @user = User.find(params[:id])
  end
end