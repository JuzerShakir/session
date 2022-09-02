class InvalidController < ApplicationController
  def not_found
    flash[:danger] = "The link your looking for doesn't exist!"
    redirect_to :root
  end
end
