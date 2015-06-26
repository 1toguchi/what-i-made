class HoursController < ApplicationController
  before_action :login_required, except: [:index, :show]

#みんなの勉強時間を比較できるようにしたい
#一週間分の勉強時間の合計を表現するには
#@user = User.find(params[:id])
#@hour = @user.hour.order(created_at: :desc).first(7)をsumする？
  def rank
    @users = User.all
    @hours = @users.hours.order(hours: :desc)   
  end

#とりあえずみんなの勉強したものの一覧
   def index
      if params[:user_id]
        @user = User.find(params[:user_id])
        @hours = @users.hours
    else
      @entries = Hour.all #ここいらない？
    end
      @hours = Hour.order(released_at: :desc).limit(7) #ここページネーションつけとくべき
   end

#生徒それぞれのステータス
  def show
    @hour = Hour.find(params[:id])
  end

	def new
		@hour = Hour.new
	end

	def edit
		@hour = Hour.find(params[:id])
	end

	def create
    @hour = Hour.new(params[:hour])
    @user = @user.hour

    if @hour.save
      redirect_to @user, notice: "勉強時間を登録しました。"
    else
      render root_path
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
