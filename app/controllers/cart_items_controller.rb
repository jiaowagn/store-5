class CartItemsController < ApplicationController
  def update
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    if @cart_item.update(cart_item_params)
      redirect_to :back
    else
      render "/carts"
    end
  end

  def destroy
    @cart_item = current_cart.cart_items.find_by(product_id: params[:id])
    @product = @cart_item.product
    @cart_item.destroy
    redirect_to :back, alert: "成功将 #{@product.title} 从购物车中删除"
  end

  private

  def cart_item_params
    params.require(:cart_item).permit(:quantity)
  end

end
