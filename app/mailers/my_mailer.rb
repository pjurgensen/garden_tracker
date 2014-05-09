class MyMailer < Devise::Mailer
  helper :application # gives access to all helpers defined within `application_helper`.
  include Devise::Controllers::UrlHelpers # Optional. eg. `confirmation_url`

  def confirmation_instructions(record, token, opts={})
    headers["Custom-header"] = "GardenTracker"
    opts[:from] = 'confirmation@garden-tracker.com'
    opts[:reply_to] = 'confirmation@garden-tracker.com'
    super
  end

  def reset_password_instructions(record, token, opts={})
    headers["Custom-header"] = "GardenTracker"
    opts[:from] = 'password-reset@garden-tracker.com'
    opts[:reply_to] = 'password-reset@garden-tracker.com'
    super
  end

  def unlock_instructions(record, token, opts={})
    headers["Custom-header"] = "GardenTracker"
    opts[:from] = 'unlock_instructions@garden-tracker.com'
    opts[:reply_to] = 'unlock_instructions@garden-tracker.com'
    super
  end

  def task_created(record, token, opts={})
    headers["Custom-header"] = "GardenTracker"
    opts[:from] = 'task_created@garden-tracker.com'
    opts[:reply_to] = 'task_created@garden-tracker.com'
    super
  end

end
