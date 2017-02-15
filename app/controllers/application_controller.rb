class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_up_path_for(resource)
    if resource.company_type == 'Shipper' || 'Haulier'
      jobs_path
    else
      root_path
    end
  end

  def after_sign_in_path_for(resource)
    if resource.company_type == 'Shipper' || 'Haulier'
      jobs_path
    else
      root_path
    end
  end

end
