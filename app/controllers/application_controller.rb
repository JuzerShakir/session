class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # if session hash is not created then current_visitor method will return nil
  def current_visitor
    Visitor.find_by(id: session[:id])
  end

  def logged_in?
    # we flip the logic with '!'
    !current_visitor.nil?
  end


  # making above methods available to view pages
  helper_method :logged_in?
end
