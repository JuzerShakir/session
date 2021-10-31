class SessionsController < ApplicationController
  def new
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
      redirect_to :root

    # if any input fields are blank
    elsif params[:email].blank? || params[:password].blank?
      flash.now[:danger] = "Fields cannot be empty!"
      render :new

    # if email enetered is not in our database
    elsif visitor == nil
      flash[:danger] = "Email doesn't exist! Please Sign up!"
      # .. then redirect them to signup page
      redirect_to :new_visitor

    # or else entered password is wrong
    else
      flash.now[:danger] = "Email exists but the password entered is wrong! Retry!"
      render :new
    end
  end

  def destroy
    session.delete(:id)
    @current_visitor = nil

    flash[:info] = "You have successfully logged out."
    redirect_to :root
  end
end
