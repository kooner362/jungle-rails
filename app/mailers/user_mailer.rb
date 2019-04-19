class UserMailer < ApplicationMailer
    default from: "no-reply@jungle.com"

    def receipt_email(user, order)
        @order = order
        @user = user
        puts user
        puts order.id
        mail(to: @user, subject: @order.id)
    end
end
