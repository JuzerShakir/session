class VisitorsController < ApplicationController

  def index
    @total = Visitor.count
    # will run method located in application_controller, will return nil for logged out user
    current_visitor
  end

  def new
    @visitor = Visitor.new
  end

  def create
    @visitor = Visitor.new(visitor_params)

    if @visitor.valid?
      @visitor.save
      session[:id] = @visitor.id
      flash[:success] = "Congrats! You have successfully logged in and a session has been created."
      redirect_to :root

    elsif Visitor.exists?(email: @visitor.email)
      flash[:warning] = "You've already signed up before, Log In to coninue.."
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
