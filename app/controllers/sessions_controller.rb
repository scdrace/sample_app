class SessionsController < ApplicationController

  def new
  end

  def create
    # puts params[:session]
    # render "new"
    # puts User.first.inspect
    # user = User.first.update(password: "foobar")
    # puts "PARAMS!!!: #{params[:sessions]}"
    # puts "PARAMS: #{params}"
    email = params[:session][:email].downcase
    password = params[:session][:password].downcase
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
