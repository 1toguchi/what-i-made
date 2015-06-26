class SessionsController < ApplicationController
	def index
		render "new"
	end 

	def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "ログインしました"



    # if user && user.authenticate(params[:pass])
    	# session[:user_id] = user.id       
    	# redirect_to root_path 
	#user = User.authenticate(params[:name],params[:password])
    # user = User.find_by_name params[:name]
    #if user   
    # user = User.authenticate(params[:name],params[:password])
    # if user && user.authenticate(params[:name][:password])
      # session[:user_id] = user.id
      # redirect_to user

       
       #session
	else
		flash.now[:notice] = "名前とパスワードが一致しません"
		render "new"
	end
	end

	def destroy
		session.delete(:user_id)
		redirect_to root_path	
	end
end
