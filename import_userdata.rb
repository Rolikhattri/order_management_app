require_relative 'config/environment' 
require 'csv'

def import_from_csv(file_path)
  CSV.foreach(file_path, headers: true) do |row|
    attributes = row.to_hash.transform_keys(&:strip)
    next if  attributes['USERNAME'].nil?

    user = User.find_or_initialize_by(email: attributes['EMAIL'])
    user.username = attributes['USERNAME']
    user.email = attributes['EMAIL']
    user.phone = attributes['PHONE']

    if user.save
      puts "User '#{attributes['USERNAME']}' imported successfully."
    else
      puts "Error importing user '#{attributes['USERNAME']}': #{user.errors.full_messages.join(', ')}"
    end
  end
end

CSV_FILE_PATH = '/home/welcome/Documents/order_management_app/users.csv'

import_from_csv(CSV_FILE_PATH)