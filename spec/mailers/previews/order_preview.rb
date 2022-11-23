# Preview all emails at http://localhost:3000/rails/mailers/order
class OrderPreview < ActionMailer::Preview
  def user_order_email

    order = Order.new(id: 1, total_cents: 43029, stripe_charge_id: "ch_3M79kILDWifHIPbQ1VY7UOAW", email: "reallygreat@yoyo.ma")

    current_user = User.new(id: 1, first_name: "Rachella", last_name: "laassst", email: "reallygreat@yoyo.ma")
    
    OrderMailer.with(order: order, user: current_user).user_order_email
  end
end
