class ApplicationController < ActionController::Base
  before_action :set_paper_trail_whodunnit
  after_action :track_action

  def root
    render 'root'
  end

  protected

  def track_action
    ahoy.track "Ran action", {
      path_parameters: request.path_parameters,
      fullpath: request.fullpath
    }
  end
end
