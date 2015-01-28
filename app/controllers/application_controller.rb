class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user, :category_all


  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
    if @current_user
      @ticket = User.find_by_id(@current_user.id).tickets.count
    end
  end

  def is_authenticated?
    if !current_user
      flash[:danger] = "You must be logged in to access that page"
      redirect_to login_path
      false
    else
      true
    end
end

  def category_all
    @category_all = Category.all
  end


end
