class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :create]
  before_action :authenticate_admin, except: [:index, :show, :create, :update]

  def index
    @users = User.all
    render "index.json.jb"
  end

  def show
    input = params["id"]
    @user = User.find_by(id: input)
    render "show.json.jb"
    # if current_user
    #   @user = current_user
    #   render "show.json.jb"
    # end
  end

  def create
    user = User.new(
      username: params[:username],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
    )
    if user.save
      render json: { message: "User created successfully" }, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :bad_request
    end
  end

  def destroy
    input = params["id"]
    @user = User.find_by(id: input)
    @user.destroy
    render json: { message: "User removed" }
  end

  def update
    if current_user
      input = params["id"]
      @user = User.find_by(id: input)
      @user.username = params["username"] || @user.username
      @user.email = params["email"] || @user.email
      if @user.save
        render "show.json.jb"
      else
        render json: { error: @user.errors.full_messages },
               status: :unprocessable_entity
      end
    end
  end
end
