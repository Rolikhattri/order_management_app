require_relative 'config/environment' 
require 'csv'

def import_orders_from_csv(file_path)
  CSV.foreach(file_path, headers: true) do |row|
    attributes = row.to_hash.transform_keys(&:strip)

    # Find user by email
    user = User.find_by(email: attributes['USER_EMAIL'])
    product = Product.find_by(code: attributes['PRODUCT_CODE'])

    if user.present?
      order = Order.new
      order.user = user
      order.product = product
      order.order_date = attributes['ORDER_DATE']

      if order.save
        puts "Order created for user '#{user.email}'"
      else
        puts "Error creating order for user '#{user.email}': #{order.errors.full_messages.join(', ')}"
      end
    else
      puts "User with email '#{attributes['USER_EMAIL']}' not found. Skipping order creation."
    end
  end
end

# Define the file path to the CSV
CSV_FILE_PATH = '/home/welcome/Documents/order_management_app/order_details.csv'

import_orders_from_csv(CSV_FILE_PATH)
