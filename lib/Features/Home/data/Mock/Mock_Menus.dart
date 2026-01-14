import 'package:delivery_app/Features/Home/data/Mock/Mock_Resturants.dart';

import '../models/RestaurantDetails_model.dart';

class MockMenuItems {
  static final Map<String, List<MenuItemModel>> itemsByCategory = {
    'Burger': [
      MenuItemModel(
        id: 'b_1',
        name: 'Classic Burger',
        description: 'Beef burger with cheese',
        price: 110,
        image: 'assets/images/burger.png',
      ),
      MenuItemModel(
        id: 'b_2',
        name: 'Double Burger',
        description: 'Double beef & cheese',
        price: 150,
        image: 'assets/images/burger.png',
      ),
      MenuItemModel(
        id: 'b_3',
        name: 'BBQ Burger',
        description: 'BBQ sauce & onion',
        price: 145,
        image: 'assets/images/burger.png',
      ),
      MenuItemModel(
        id: 'b_4',
        name: 'Mushroom Burger',
        description: 'Mushroom & cheese',
        price: 140,
        image: 'assets/images/burger.png',
      ),
      MenuItemModel(
        id: 'b_5',
        name: 'Chicken Burger',
        description: 'Grilled chicken',
        price: 120,
        image: 'assets/images/burger.png',
      ),
      MenuItemModel(
        id: 'b_6',
        name: 'Spicy Burger',
        description: 'Hot sauce',
        price: 135,
        image: 'assets/images/burger.png',
      ),
    ],

    'Pizza': [
      MenuItemModel(
        id: 'p_1',
        name: 'Margherita',
        description: 'Tomato & mozzarella',
        price: 130,
        image: 'assets/images/pizza.png',
      ),
      MenuItemModel(
        id: 'p_2',
        name: 'Pepperoni',
        description: 'Pepperoni & cheese',
        price: 165,
        image: 'assets/images/pizza.png',
      ),
      MenuItemModel(
        id: 'p_3',
        name: 'BBQ Chicken',
        description: 'BBQ sauce & chicken',
        price: 175,
        image: 'assets/images/pizza.png',
      ),
      MenuItemModel(
        id: 'p_4',
        name: 'Vegetarian',
        description: 'Fresh vegetables',
        price: 140,
        image: 'assets/images/pizza.png',
      ),
      MenuItemModel(
        id: 'p_5',
        name: 'Cheese Lovers',
        description: 'Extra cheese',
        price: 155,
        image: 'assets/images/pizza.png',
      ),
      MenuItemModel(
        id: 'p_6',
        name: 'Seafood Pizza',
        description: 'Shrimp & calamari',
        price: 190,
        image: 'assets/images/pizza.png',
      ),
    ],

    'Sandwich': [
      MenuItemModel(
        id: 's_1',
        name: 'Chicken Sandwich',
        description: 'Grilled chicken',
        price: 90,
        image: 'assets/images/sandwich.png',
      ),
      MenuItemModel(
        id: 's_2',
        name: 'Beef Sandwich',
        description: 'Beef strips',
        price: 100,
        image: 'assets/images/sandwich.png',
      ),
      MenuItemModel(
        id: 's_3',
        name: 'Hot Dog',
        description: 'Sausage',
        price: 80,
        image: 'assets/images/sandwich.png',
      ),
      MenuItemModel(
        id: 's_4',
        name: 'Shawarma',
        description: 'Chicken shawarma',
        price: 85,
        image: 'assets/images/sandwich.png',
      ),
      MenuItemModel(
        id: 's_5',
        name: 'Tuna Sandwich',
        description: 'Tuna & mayo',
        price: 95,
        image: 'assets/images/sandwich.png',
      ),
      MenuItemModel(
        id: 's_6',
        name: 'Spicy Sandwich',
        description: 'Spicy chicken',
        price: 100,
        image: 'assets/images/sandwich.png',
      ),
    ],

    'Chicken': [
      MenuItemModel(
        id: 'c_1',
        name: 'Fried Chicken',
        description: 'Crispy fried',
        price: 150,
        image: 'assets/images/chicken.png',
      ),
      MenuItemModel(
        id: 'c_2',
        name: 'Grilled Chicken',
        description: 'Grilled breast',
        price: 145,
        image: 'assets/images/chicken.png',
      ),
      MenuItemModel(
        id: 'c_3',
        name: 'Chicken Wings',
        description: 'Spicy wings',
        price: 130,
        image: 'assets/images/chicken.png',
      ),
      MenuItemModel(
        id: 'c_4',
        name: 'Chicken Strips',
        description: 'Crispy strips',
        price: 120,
        image: 'assets/images/chicken.png',
      ),
      MenuItemModel(
        id: 'c_5',
        name: 'Chicken Bucket',
        description: 'Family bucket',
        price: 220,
        image: 'assets/images/chicken.png',
      ),
      MenuItemModel(
        id: 'c_6',
        name: 'Spicy Chicken',
        description: 'Hot & spicy',
        price: 155,
        image: 'assets/images/chicken.png',
      ),
    ],
  };

  static List<MenuItemModel> getItemsByRestaurantId(String restaurantId) {
    final restaurant = Mock_resturants().Restaurants.firstWhere(
      (r) => r.id == restaurantId,
    );

    return itemsByCategory[restaurant.category] ?? [];
  }
}
