class DeviseMyMailer < Devise::Mailer
  default template_path: 'devise/mailers/reset_password_instructions.html.erb'
end