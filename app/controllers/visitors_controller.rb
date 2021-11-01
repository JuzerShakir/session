class VisitorsController < ApplicationController

  def index
    @total = Visitor.count
    # will run method located in application_controller, will return nil for logged out user
    current_visitor
  end

  def new
    # if logged-in visitor manually tries to visit signup page, will redirect them to user
    current_visitor
    if @current_visitor
      flash[:warning] = "You're already logged in! If you want to sign up with different email, then sign out first."
      redirect_to :root
    else
      @visitor = Visitor.new
    end
  end

  def create
    @visitor = Visitor.new(visitor_params)

    if @visitor.valid?
      @visitor.save
      session[:id] = @visitor.id
      flash[:success] = "Congrats! You have successfully logged in and a session has been created."
      redirect_to :root

    elsif Visitor.exists?(email: @visitor.email)
      flash[:warning] = "#{@visitor.email} is already in use! You can Log In with this email."
      redirect_to :login

    else
      render :new
    end

  end

  private
    def visitor_params
      params.require(:visitor).permit(:email, :password, :password_confirmation)
    end
end
