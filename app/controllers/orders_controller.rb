# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def download_csv
    @user = User.find(params[:user_id])
    @orders = Order.where(user_id: params[:user_id])
    respond_to do |format|
      format.csv { send_data @orders.to_csv, filename: "#{@user.username}_orders.csv" }
    end
  end
end
