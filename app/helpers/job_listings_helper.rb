module JobListingsHelper
  def application_status_color(job_listing)
    case job_listing.application_status.to_sym
    when :open
      "info"
    when :sent
      "primary"
    when :interviewing
      "warning"
    when :offer
      "success"
    when :rejected
      "danger"
    when :closed
      "secondary"
    else
      "secondary"
    end
  end
end
