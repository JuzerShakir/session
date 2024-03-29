class SessionsController < ApplicationController

  def new
    # if logged-in visitor manually tries to visit login page, will redirect them to the root
    if logged_in?
      flash[:warning] = "You're already logged in! If you want to login with different email, then logout first."
      redirect_to :root
    end
  end

  def create

    # finds visitor with corresponding email, returns nil if not found or else a hash
    visitor = Visitor.find_by_email(params[:email])

    # if visitor is found and the password entered matches with the password in db..
    if visitor && visitor.authenticate(params[:password])
      # ..then set the session
      session[:id] = visitor.id
      flash[:success] = "Welcome Back! A session has been created."
      # home page
      redirect_to root_path

    # if any input fields are blank
    elsif params[:email].blank? || params[:password].blank?
      flash.now[:danger] = "Fields cannot be empty!"
      render :new

    # if email enetered is not in our database
    elsif visitor == nil
      flash[:danger] = "Email doesn't exist! Please Sign up!"
      # .. then redirect them to signup page
      redirect_to :signup

    # or else entered password is wrong
    else
      flash.now[:danger] = "Email exists but the password entered is wrong! Retry!"
      render :new
    end
  end

  def destroy
    # Used this method to destroy session to Countermeasure against Session Fixation. More on this: [https://guides.rubyonrails.org/security.html#session-fixation]
    reset_session
    # not necessory but just in case
    @current_visitor = nil

    flash[:info] = "You have successfully logged out."
    redirect_to :root
  end
end
