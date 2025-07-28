class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_admin!

  def index
    @users_count = User.count
    @complaints_count = Complain.count
    @latest_complaints = Complain.order(created_at: :desc).limit(5)
  end

  private

  def authorize_admin!
    unless current_user && current_user.user_type == 'admin'
      redirect_to root_path, alert: 'Access denied: Admins only.'
    end
  end
end
