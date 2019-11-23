class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :ensure_admin_user!
  def ensure_admin_user!
  unless current_user and current_user.admin?
    redirect_to root_path, notice:"you are not admin, ask for help?"
  end
  end
  # GET /users
  # GET /users.json
  def index  
User.find_each do |user|
    @users = User.all
end
    @meetings = Meeting.all
  end
  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
    def update
      if params[:mentor]
        @team.update(mentor: params[:mentor])
        redirect_to admin_users_path, notice: 'this user become mentor'
      elsif @user.update(user_params)
          format.html { redirect_to @user, notice: 'User was successfully updated.' }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      
      end
    end
  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
  if params[:mentor]
    @user.update(mentor: params[:mentor])
      redirect_to @user, notice: 'user changed'
  elsif @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
    
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:firstName, :lastName, :email, :address, :bio, :occupation, :expertise, :admin, :mentor, :password, :password_confirmation)
    end
end
