class SessionsController < ApplicationController
  def new
  end

  def create
    visitor = Visitor.find_by_email(params[:email])
    if visitor && visitor.authenticate(params[:password])
      session[:id] = visitor.id
      flash[:success] = "You have successfully logged in."
      redirect_to :root
    else
      flash[:error] = "Wrong Credentials! Try Again!"
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
