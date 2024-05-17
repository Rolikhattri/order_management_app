class Order < ApplicationRecord
  belongs_to :user
  belongs_to :product

  require 'csv'
  def self.to_csv
    attributes = %w[USERNAME USER_EMAIL PRODUCT_CODE PRODUCT_NAME PRODUCT_CATEGORY ORDER_DATE]
    CSV.generate(headers: true) do |csv|
      csv << attributes
      all.each do |order|
        csv << [order.user.username,order.user.email,order.product.code,order.product.name,order.product.category,order.order_date]
      end
    end
  end
end