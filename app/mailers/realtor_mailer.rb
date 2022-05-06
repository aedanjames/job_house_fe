class RealtorMailer < ApplicationMailer

  def email_realtor(recipient, mls_id, user_email)
    @recipient = recipient
    @user_email = user_email
    @mls_id = mls_id
    mail(to: @recipient, subject: "Inquiry Into Property With MLS ID: #{mls_id}")
  end
end