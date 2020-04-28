class UserMailer < ApplicationMailer
    default from: 'hello@cats99.me'

    def welcome_email(user)
        @user = user
        @url = '99cats.me'
        mail(to: 'test@user.com', subject: 'nothing is real...')
    end
end
