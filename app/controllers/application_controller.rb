class ApplicationController < ActionController::Base
	protect_from_forgery with: :exception
	before_action :authenticate_user!
    before_action :categories
    before_action :brands
    before_action :configure_permitted_parameters, if: :devise_controller?
    def configure_permitted_parameters
    	#devise_parameter_sanitizer.permit(:sign_up) { |u| u.permits(:email, :password, :password_confirmation, :role)}
    	devise_parameter_sanitizer.permit(:sign_up, keys: [:role])
    	devise_parameter_sanitizer.permit(:account_update, keys: [:role])
    end
    rescue_from CanCan::AccessDenied do |exception|
          respond_to do |format|
          	format.json {head :forbidden}
          	format.html {redirect_to main_app.product_url, :alert => "Not Authorized!"}
          end
     end      

	 def categories
	 	@categories = Category.order(:name)
	 end	
	 
	 def brands
	 	@brands = Product.pluck(:brand).sort.uniq	
	 end	 
end