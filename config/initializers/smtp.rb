if Rails.env.production?

  VimPastebin::Application.config.action_mailer.default_url_options = { :host => VimPastebin.config.smtp.domain }
  VimPastebin::Application.config.mailer_sender = VimPastebin.config.email
  ActionMailer::Base.default_options = {
    :from =>           VimPastebin.config.email
  }

  if VimPastebin.config.smtp.enabled
    ActionMailer::Base.smtp_settings = {
      :port =>           VimPastebin.config.smtp.port,
      :address =>        VimPastebin.config.smtp.host,
      :user_name =>      VimPastebin.config.smtp.user,
      :password =>       VimPastebin.config.smtp.password,
      :domain =>         VimPastebin.config.smtp.domain,
      :authentication => :plain
    }
    ActionMailer::Base.delivery_method = :smtp
  else
    ActionMailer::Base.delivery_method = :sendmail
  end

end
