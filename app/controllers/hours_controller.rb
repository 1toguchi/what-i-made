class HoursController < ApplicationController
  before_action :login_required, except: [:index, :show]


  def index
    @hours = Hour.all.order(post_date: :desc)
  end

  def show
    if params[:user_id]
    @hour = Hour.find(params[:id])
    @user = @user.hours
    else
      redirect_to root_path
    end
  end

	def new
		@hour = Hour.new
	end

	def edit
		@hour = Hour.find(params[:id])
	end

	def create
    @hour = current_user.hours.create(params[:hour])

    if @hour.save
      redirect_to current_user, notice: "勉強時間を登録しました。"
    else
      redirect_to root_path
    end
  end
		
  def update
     @hour = Hour.find(params[:id])
     @hour.assign_attributes(params[:hour])
     if @hour.save
       redirect_to @hour, notice: "ニュース記事を更新しました。"
     else
       render "edit"
     end
  end

  def destroy
    @hour = Hour.find(params[:id])
    @hour.destroy
    redirect_to :hours
  end
end
