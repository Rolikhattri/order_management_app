require_relative 'config/environment' 
require 'csv'

def import_from_csv(file_path)
  CSV.foreach(file_path, headers: true) do |row|
    attributes = row.to_hash.transform_keys(&:strip)
    next if  attributes['CODE'].nil?
    product = Product.find_or_initialize_by(code: attributes['CODE'])

    product.code = attributes['CODE']
    product.name = attributes['NAME']
    product.category = attributes['CATEGORY']

    if product.save
      puts "Product '#{attributes['CODE']}' imported successfully."
    else
      puts "Error importing product '#{attributes['CODE']}': #{product.errors.full_messages.join(', ')}"
    end
  end
end

CSV_FILE_PATH = '/home/welcome/Documents/order_management_app/products.csv'

import_from_csv(CSV_FILE_PATH)