require "mandrill"

class PostMailer < ActionMailer::Base
  def post_created(current_user)
    mail(to: current_user.email, 
    subject: "Thanks for your post", 
    body: mandrill_template("foodhunt"))
    # mail(to: current_user.email, 
    # from: "adisazizan@gmail.com",
    # subject:"Thanks for your post",
    # body:"Your restaurant has been posted. Thank you for using this application.")
  end
end