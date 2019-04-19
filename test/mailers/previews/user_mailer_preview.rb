class UserMailerPreview < ActionMailer::Preview

    def new_order
      order = Order.last
      UserMailer.receipt_email('kooner@gmail.com', order).deliver
    end
  
end