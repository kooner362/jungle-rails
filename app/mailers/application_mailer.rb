class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@jungle.com"

  def order_subtotal_cents(order)
    order.map {|entry| entry.product.price_cents * entry.quantity}.sum
  end
  helper_method :order_subtotal_cents
end