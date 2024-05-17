# order_management_app

* Order Management System is to manage and download orders for users

* Ruby version- 2.6.3

* Database creation- 
	* rake db:create
	* rake db:migrate 
* To seed data from csv file to table-
 	1. Import User data
	 	* keep csv file in order_management_app folder
		* update csv file path in import_userdata.rb file
		* run import_userdata.rb script using command- ruby import_userdata.rb
	2. Import Product data
	 	* keep csv file in order_management_app folder
		* update csv file path in import_productdata.rb file
		* run import_productdata.rb script using command- ruby import_productdata.rb
	3. Import Order data
	 	* keep csv file in order_management_app folder
		* update csv file path in import_order_data.rb file
		* run import_order_data.rb script using command- ruby import_order_data.rb
* Run server using command- rails s


