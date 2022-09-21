class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

# https://liliel-psy.hatenablog.com/entry/2021/04/12/033738　（フラッシュメッセージ実装）
  add_flash_types :success, :info, :warning, :danger

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
    # # notice :'Signed out successfully.'
     flash[:notice] = "Signed out successfully."
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
