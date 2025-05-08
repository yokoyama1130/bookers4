class ApplicationController < ActionController::Base
  before_action :is_matching_login_user, only: [:edit, :update]
  # before_action :authenticate_user!, except: [:top] 
  # before_action :configure_permitted_parameters,if: :devise_controller?

  # ログイン後の遷移先の変更　一覧画面へ遷移するように設定した。
	def after_sign_in_path_for(resource)
	  post_images_path
	end
  
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end