class Admin::SessionsController < Admin::BaseController
  skip_before_action :authenticate!, only: %i[new create]

  def new; end

  def create
    if correct_credentials?
      admin_sign_in
      redirect_to admin_root_path
    else
      flash[:alert] = 'Wrong password'
      render :new
    end
  end

  def destroy
    admin_sign_out
    flash[:notice] = 'Signed out'
    redirect_to new_admin_session_path
  end

  private

  def correct_credentials?
    params[:admin_password].present? &&
      params[:admin_password] == Rails.application.credentials.admin_password
  end
end
