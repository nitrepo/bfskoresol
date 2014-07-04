class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_needed_email.subject
  #
  def activation_needed_email(user)
  @user = user
  attachments.inline['logo_aqua.png'] = File.read('app/assets/images/logoimage.png')
  attachments.inline['picture1.jpg'] = File.read('app/assets/images/picture1.png')
  attachments.inline['picture2.jpg'] = File.read('app/assets/images/picture2.png')
  attachments.inline['icon_facebook.png'] = File.read('app/assets/images/icon_facebook.png')
  attachments.inline['icon_twitter.png'] = File.read('app/assets/images/icon_twitter.png')
  attachments.inline['icon_youtube.png'] = File.read('app/assets/images/icon_youtube.png')
  @url  = "http://bfskoresol.com/users/#{user.activation_token}/activate"
  mail(:to => user.email,
       :subject => "Welcome to Koresol Site")
end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.activation_success_email.subject
  #
  def activation_success_email(user)
  @user = user
  attachments.inline['logo_aqua.png'] = File.read('app/assets/images/logoimage.png')
  attachments.inline['picture1.jpg'] = File.read('app/assets/images/picture1.png')
  attachments.inline['picture2.jpg'] = File.read('app/assets/images/picture2.png')
  attachments.inline['icon_facebook.png'] = File.read('app/assets/images/icon_facebook.png')
  attachments.inline['icon_twitter.png'] = File.read('app/assets/images/icon_twitter.png')
  attachments.inline['icon_youtube.png'] = File.read('app/assets/images/icon_youtube.png')
  @url  = "http://bfskoresol.com/login"
  mail(:to => user.email,
       :subject => "Your account is now activated")
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.reset_password_email.subject
  #
  def reset_password_email(user)
  @user = user

  attachments.inline['logo_aqua.png'] = File.read('app/assets/images/logoimage.png')
  attachments.inline['picture1.jpg'] = File.read('app/assets/images/picture1.png')
  attachments.inline['picture2.jpg'] = File.read('app/assets/images/picture2.png')
  attachments.inline['icon_facebook.png'] = File.read('app/assets/images/icon_facebook.png')
  attachments.inline['icon_twitter.png'] = File.read('app/assets/images/icon_twitter.png')
  attachments.inline['icon_youtube.png'] = File.read('app/assets/images/icon_youtube.png')


  @url  = edit_password_reset_url(user.reset_password_token)
  mail(:to => user.email,
       :subject => "Your password has been reset")
end


end
