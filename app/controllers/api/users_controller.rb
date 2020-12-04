class Api::UsersController < ApplicationController
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
    @user = User.new({
      username: params["username"],
      email: params["email"],
      password_digest: params["password_digest"],
    })
    if @user.save
      render "show.json.jb"
    else
      render json: { errors: @user.errors.full_messages },
             status: :unprocessable_entity
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
