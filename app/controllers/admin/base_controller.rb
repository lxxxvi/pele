class Admin::BaseController < ApplicationController
  include Admin::ApplicationHelper

  before_action :authenticate!
  layout 'admin/layouts/application'

  private

  def authenticate!
    return if admin_signed_in?

    flash[:notice] = 'Please login first'
    redirect_to new_admin_session_path
  end

  def admin_sign_in
    session[:admin_signed_in] = true
  end

  def admin_sign_out
    session.delete(:admin_signed_in)
  end
end
