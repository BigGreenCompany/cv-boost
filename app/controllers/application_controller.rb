class ApplicationController < ActionController::Base
  after_action :track_action

  def root
    render 'root'
  end

  protected

  def track_action
    ahoy.track "Ran action", request.path_parameters
  end
end
