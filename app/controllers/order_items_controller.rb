class OrderItemsController < ApplicationController
	def create
		@order = current_order
		@order_item = @order.order_items.new(order_params)
		if @order.save
		  ShopsMailer.with(order: @order).new_order_email.deliver_now
		end
		session[:order_id] = @order.id
	end

	def update
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		@order_item.update_attributes(order_params)
		@order_items = current_order.order_items
	end

	def destroy
		@order = current_order
		@order_item = @order.order_items.find(params[:id])
		if @order_item.destroy
			ShopsMailer.with(order: @order).delete_order_email.deliver_now
		end
		@order_items = current_order.order_items
	end

	private

	def order_params
		params.require(:order_item).permit(:product_id, :quantity)
	end
end
