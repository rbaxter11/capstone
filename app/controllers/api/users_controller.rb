class Api::UsersController < ApplicationController
  before_action :authenticate_user, except: [:index, :show, :new]
  before_action :authenticate_admin, except: [:index, :show, :create, :update, :new]

  def index
    @users = User.all
    render "index.json.jb"
  end

  def show
    input = params["id"]
    @user = User.find_by(id: input)
    render "show.json.jb"
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
  end

  def new
  end
end
