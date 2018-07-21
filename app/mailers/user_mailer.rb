class UserMailer < ApplicationMailer

  def order_email(order)
    @order = order
    mail(to: order.email, subject: "Your order has been confirmed! Order ##{order.id}")
  end
end
