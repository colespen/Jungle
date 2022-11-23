class OrderMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
 
  def user_order_email
    @order = params[:order]
    @current_user = params[:user]
    @url_order  = "http://localhost:3000/orders/#{@order.id}"
    @url_browse  = "http://localhost:3000/"
    mail(to: "spencerlewiscole@gmail.com", subject: "The Jungle ~ Order id: #{@order.id} Successful!")
  end
end
