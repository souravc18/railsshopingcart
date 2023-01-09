class ShopsMailer < ApplicationMailer
	def new_order_email
		@order = params[:order]
		@user  = User.all
		mail(to: @user.pluck(:email), subject: "Recieved your order!")
	end

	def delete_order_email
		@order = params[:order]
		@user  = User.all
		mail(to: @user.pluck(:email), subject: "Cancel Order!!")
	end
end
