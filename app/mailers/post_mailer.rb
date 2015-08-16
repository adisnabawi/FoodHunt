class PostMailer < ActionMailer::Base
  def post_created(current_user)
    mail(to: current_user.email, 
    from: "adisazizan@gmail.com",
    subject:"Welcome",
    body:"This is the test mail")
  end
end