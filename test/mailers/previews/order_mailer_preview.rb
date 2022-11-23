class OrderMailerPreview < ActionMailer::Preview
  def user_order_email
    order = Order.new(total_cents: 43029, stripe_charge_id: "ch_3M79kILDWifHIPbQ1VY7UOAW", email: "reallygreat@yoyo.ma")
    
    OrderMailer.with(order: order).user_order_email
  end

end