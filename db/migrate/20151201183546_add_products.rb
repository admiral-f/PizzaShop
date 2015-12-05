class AddProducts < ActiveRecord::Migration
  def change
  	Product.create ({
  		:category => 'pizza', 
  		:title => 'Hawaiian', 
  		:description =>'Think classic pizza toppings and you’re thinking the Hawaiian Special. On this all time favourite, tender cured ham and perfectly sliced baby portobello mushrooms are complemented by juicy pineapple chunks and mozzarella cheese for a sweet and savoury taste sensation.',
  		:price => 5, 
  		:size => 30, 
  		:is_spicy => false, 
  		:is_veg => false, 
  		:is_best_offer => true, 
  		:path_to_image => '/img/hawaiian.jpg'
  		})

  	Product.create ({
  		:category => 'pizza', 
  		:title => 'Pepperoni', 
  		:description => 'Pepperoni pizza has all the passion and flavour the name suggests with double Italian style sausage, flavoursome pepperoni and a sprinkle of crushed chillies – all on our 100% fresh dough base. Fantastico!', 
  		:price => 4, 
  		:size => 30, 
  		:is_spicy => true, 
  		:is_veg => false, 
  		:is_best_offer => false, 
  		:path_to_image => '/img/pepperoni.jpg'
  		})

  	Product.create ({
  		:category => 'pizza',
  		:title => 'Margarita', 
  		:description => 'Classic vegetarian pizza. Fantastico!', 
  		:price => 4, 
  		:size => 30, 
  		:is_spicy => false, 
  		:is_veg => true, 
  		:is_best_offer => true, 
  		:path_to_image => '/img/margarita.jpg'
      })

  	  	Product.create ({
  		:category => 'pizza', 
  		:title => 'Hawaiian', 
  		:description =>'Think classic pizza toppings and you’re thinking the Hawaiian Special. On this all time favourite, tender cured ham and perfectly sliced baby portobello mushrooms are complemented by juicy pineapple chunks and mozzarella cheese for a sweet and savoury taste sensation.',
  		:price => 6, 
  		:size => 45, 
  		:is_spicy => false, 
  		:is_veg => false, 
  		:is_best_offer => true, 
  		:path_to_image => '/img/hawaiian.jpg'
  		})

  	Product.create ({
  		:category => 'pizza', 
  		:title => 'Pepperoni', 
  		:description => 'Pepperoni pizza has all the passion and flavour the name suggests with double Italian style sausage, flavoursome pepperoni and a sprinkle of crushed chillies – all on our 100% fresh dough base. Fantastico!', 
  		:price => 5, 
  		:size => 45, 
  		:is_spicy => true, 
  		:is_veg => false, 
  		:is_best_offer => false, 
  		:path_to_image => '/img/pepperoni.jpg'
  		})

  	Product.create ({
  		:category => 'pizza',
  		:title => 'Margarita', 
  		:description => 'Classic vegetarian pizza. Fantastico!', 
  		:price => 5, 
  		:size => 45, 
  		:is_spicy => false, 
  		:is_veg => true, 
  		:is_best_offer => true, 
  		:path_to_image => '/img/margarita.jpg'
      })

    Product.create ({
      :category => 'salad',
      :title => 'Greek salad', 
      :description => 'Choriatiki or Horiatiki salad, or Greek Salad as it is known worldwide, means country or village salad, following the meaning of the word “horiatiki” in Greek', 
      :price => 2, 
      :is_veg => true, 
      :is_best_offer => true, 
      :path_to_image => '/img/greek_salad.jpg'
      })

    Product.create ({
      :category => 'salad',
      :title => 'Cesar salad', 
      :description => 'Ave, Cesar!!!', 
      :price => 2, 
      :is_veg => true, 
      :is_best_offer => false, 
      :path_to_image => '/img/cesar_salad.jpg'
      })

    Product.create ({
      :category => 'salad',
      :title => 'Fruit salad', 
      :description => 'Strawberries, blueberries, kiwi, milk', 
      :price => 2, 
      :is_veg => false, 
      :is_best_offer => true, 
      :path_to_image => '/img/fruit_salad.jpg'
      })

    Product.create ({
      :category => 'drink',
      :title => 'Coca-Cola', 
      :description => 'Classic Coca-Cola', 
      :price => 1, 
      :is_veg => true, 
      :is_best_offer => true, 
      :path_to_image => '/img/cola.jpg'
      })

    Product.create ({
      :category => 'drink',
      :title => 'Fanta', 
      :description => 'Classic Fanta drink', 
      :price => 1, 
      :is_veg => true, 
      :is_best_offer => true, 
      :path_to_image => '/img/fanta.jpg'
      })

    Product.create ({
      :category => 'drink',
      :title => 'Sprite', 
      :description => 'Lemon Sprite', 
      :price => 1, 
      :is_veg => true, 
      :is_best_offer => true, 
      :path_to_image => '/img/sprite.jpg'
      })

  end
end
