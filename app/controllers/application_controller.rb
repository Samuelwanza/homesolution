class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    before_action :update_allowed_parameters, if: :devise_controller?
  
    protected
  
    def update_allowed_parameters
      devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :telephone, :email, :password, :role) }
      devise_parameter_sanitizer.permit(:account_update) do |u|
        u.permit(:name, :telephone, :email, :password, :current_password, :role)
      end
    end
  
    def after_sign_in_path_for(resource)
      if resource.role.present?
        case resource.role.downcase
        when 'owner'
          owner_dashboard_index_path
        when 'tenant'
          tenant_dashboard_index_path
        when 'admin'
          admin_dashboard_index_path
        else
          super
        end
      else
        super
      end
    end
  end
  