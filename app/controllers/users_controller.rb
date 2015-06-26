class UsersController < ApplicationController
  #関連付けってモデルでやったことない？
  #attr_accessor :name, :email
  
  def index
  	@user = User.all
  end 

  def show
  	@user = User.find(params[:id])
    @hours = @user.hours.paginate(page:params[:page])
  end

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user, notice: "登録しました。"
    else
      render "new"
    end
  end

  def update
    @user = User.find(params[:id])
    @user.assign_attributes(params[:user])
    if @user.save
      redirect_to @user, notice: "登録情報を更新しました"
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to :users, notice: "削除しました。"
  end

   # private
    # def user_params
      # params.require(:user).permit(:name, :email, :password,:password_confirmation)
    # end
end
