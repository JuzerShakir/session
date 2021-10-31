class SessionsController < ApplicationController
  def new
  end

  def create
    visitor = Visitor.find_by_email(params[:email])

    if visitor && visitor.authenticate(params[:password])
      session[:id] = visitor.id
      flash[:success] = "Welcome Back! A session has been created."
      redirect_to :root

    elsif params[:email].blank? || params[:password].blank?
      flash[:error] = "Fields cannot be empty!"
      render :new

    elsif visitor == nil
      flash[:error] = "Email doesn't exist! Please Sign up!"
      redirect_to :new_visitor
    else
      flash[:error] = "Password is wrong! Retry!"
      render :new
    end
  end

  def destroy
    session.delete(:id)
    @current_visitor = nil

    flash[:notice] = "You have successfully logged out."
    redirect_to :root
  end
end
