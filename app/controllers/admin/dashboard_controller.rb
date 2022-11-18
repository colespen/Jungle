class Admin::DashboardController < Admin::BaseController
  def show
    @total_product_count = Product.count
    @total_category_count = Category.count
  end
end