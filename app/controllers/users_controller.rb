class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    @users = User.all
  end

  def show
    @collections = @user.votes
  end

  def new
    @user = User.new
  end

  def edit
  end

  def sign_in
    @user = User.new
  end

  def login
    if User.find_by(name: params[:name])
      @user = User.find_by(name: params[:name])
      session[:current_user_id] = @user.id
      flash[:notice] = "Welcome back #{@user.name}!"
      redirect_to root_path
    else
      flash[:notice] = 'Register a new account here.'
      redirect_to new_user_path
    end
  end

  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        session[:current_user_id] = @user.id
        format.html { redirect_to root_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    session.delete(:current_user_id)
    redirect_to root_path
  end

  private

  def set_user
    @user = if session[:current_user_id].is_a? Integer
              User.find(session[:current_user_id])
            else
              User.find(params[:id])
            end
  end

  def user_params
    params.require(:user).permit(:name)
  end
end
