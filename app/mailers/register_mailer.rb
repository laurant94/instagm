class RegisterMailer < ApplicationMailer
  def confirm(user)
    @user = user
    mail( to: @user.email, subject: "#{Rails.application.config.site[:name]}: Validation de votre compte"  )
  end

  def post_confirm(user, post)
    @user = user
    @post = post
    mail(to: user.email, subject: "#{Rails.application.config.site[:name]}: Confirmation de publication")
  end

end
