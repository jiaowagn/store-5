class CartItemsController < ApplicationController
  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    redirect_to :back, alert: "成功将 #{@product.title} 从购物车中删除"
  end
end
