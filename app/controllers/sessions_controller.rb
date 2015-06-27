class SessionsController < ApplicationController
	def index
		render "new"
	end 

	def create
    user = User.find_by_name(params[:name])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, :notice => "ログインしました"

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
