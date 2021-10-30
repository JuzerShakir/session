class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_visitor
    if session[:id]
      @current_visitor ||= Visitor.find(session[:id])
    end
  end

  helper_method :current_visitor

end
