class AddProducts < ActiveRecord::Migration
  def change
  	Product.create :title => 'Hawaiian', :description =>'Think classic pizza toppings and you’re thinking the Hawaiian Special. On this all time favourite, tender cured ham and perfectly sliced baby portobello mushrooms are complemented by juicy pineapple chunks and mozzarella cheese for a sweet and savoury taste sensation.', :price => 5, :size => 30, :is_spicy => false, :is_veg => false, :is_best_offer => true, :path_to_image => '/img/hawaiian.jpg'

  	Product.create :title => 'Pepperoni', :description => 'Pepperoni pizza has all the passion and flavour the name suggests with double Italian style sausage, flavoursome pepperoni and a sprinkle of crushed chillies – all on our 100% fresh dough base. Fantastico!', :price => 4, :size => 30, :is_spicy => true, :is_veg => false, :is_best_offer => false, :path_to_image => '/img/pepperoni.jpg'

  	Product.create :title => 'Margarita', :description => 'Classic vegetarian pizza. Fantastico!', :price => 4, :size => 30, :is_spicy => false, :is_veg => true, :is_best_offer => true, :path_to_image => '/img/margarita.jpg'


  end
end
