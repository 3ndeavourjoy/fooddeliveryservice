import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fooddeliveryservice/models/cart_item.dart';
import 'package:fooddeliveryservice/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier {
  final List<Food> _menu = [
    // Burgers
    Food(
      name: "BBQ Chicken Cheese Burger",
      descriptions: "Grilled chicken burger topped with BBQ sauce and melted cheese",
      imagepath: "lib/images/burgers/BBQChickenCheeseBurger.png",
      price: 9.00,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Avocado", price: 2.00),
        Addon(name: "Extra Cheese", price: 1.00),
        Addon(name: "Grilled Onion", price: 1.00),
      ],
    ),
    Food(
      name: "Beef Burger",
      descriptions: "Classic beef patty with lettuce, tomato, and onion on a toasted bun",
      imagepath: "lib/images/burgers/BeefBurger.png",
      price: 8.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Avocado", price: 2.00),
        Addon(name: "Extra Cheese", price: 1.00),
        Addon(name: "Grilled Onion", price: 1.00),
      ],
    ),
    Food(
      name: "Chicken Burger",
      descriptions: "Grilled chicken burger with a smoky flavor, topped with crispy extra meat and BBQ sauce",
      imagepath: "lib/images/burgers/ChickenBurger.png",
      price: 9.50,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Avocado", price: 2.00),
        Addon(name: "Extra Cheese", price: 1.00),
        Addon(name: "Grilled Onion", price: 1.00),
      ],
    ),
    Food(
      name: "Chicken Cheese Burger",
      descriptions: "Juicy chicken patty topped with melted cheese, lettuce, and tomato",
      imagepath: "lib/images/burgers/ChickenCheeseBurger.png",
      price: 8.00,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Avocado", price: 2.00),
        Addon(name: "Extra Cheese", price: 1.00),
        Addon(name: "Grilled Onion", price: 1.00),
      ],
    ),
    Food(
      name: "Chicken Naga Burger",
      descriptions: "Spicy chicken burger infused with Naga chili peppers for a fiery kick",
      imagepath: "lib/images/burgers/ChickenNagaBurger.png",
      price: 9.00,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Avocado", price: 2.00),
        Addon(name: "Extra Cheese", price: 1.00),
        Addon(name: "Grilled Onion", price: 1.00),
      ],
    ),

    // Cold Coffee
    Food(
      name: "Chocolate Cold Coffee",
      descriptions: "Decadent cold coffee with a rich chocolate twist",
      imagepath: "lib/images/coldcoffee/ChocolateColdCoffee.png",
      price: 5.50,
      category: FoodCategory.coldcoffee,
      availableAddons: [
        Addon(name: "Extra Espresso Shot", price: 1.00),
        Addon(name: "Caramel Drizzle", price: 0.75),
        Addon(name: "Whipped Cream", price: 0.50),
      ],
    ),
    Food(
      name: "Peanut Cold Coffee",
      descriptions: "A unique cold coffee blend with a rich, nutty peanut flavor",
      imagepath: "lib/images/coldcoffee/PeanutChocolateCoffee.png",
      price: 5.50,
      category: FoodCategory.coldcoffee,
      availableAddons: [
        Addon(name: "Extra Espresso Shot", price: 1.00),
        Addon(name: "Caramel Drizzle", price: 0.75),
        Addon(name: "Whipped Cream", price: 0.50),
      ],
    ),
    Food(
      name: "Regular Cold Coffee",
      descriptions: "Classic iced coffee, chilled and refreshing with a bold coffee taste",
      imagepath: "lib/images/coldcoffee/RegularColdCoffee.png",
      price: 4.00,
      category: FoodCategory.coldcoffee,
      availableAddons: [
        Addon(name: "Extra Espresso Shot", price: 1.00),
        Addon(name: "Caramel Drizzle", price: 0.75),
        Addon(name: "Whipped Cream", price: 0.50),
      ],
    ),
    Food(
      name: "Vanilla Cold Coffee",
      descriptions: "A smooth and refreshing cold coffee infused with sweet vanilla flavor",
      imagepath: "lib/images/coldcoffee/VanillaColdCoffee.png",
      price: 5.00,
      category: FoodCategory.coldcoffee,
      availableAddons: [
        Addon(name: "Extra Espresso Shot", price: 1.00),
        Addon(name: "Caramel Drizzle", price: 0.75),
        Addon(name: "Whipped Cream", price: 0.50),
      ],
    ),
    Food(
      name: "Vanilla Oreo Cold Coffee",
      descriptions: "A creamy cold coffee blended with vanilla flavor and crunchy Oreo cookies",
      imagepath: "lib/images/coldcoffee/VaniOreoColdCoffee.png",
      price: 5.50,
      category: FoodCategory.coldcoffee,
      availableAddons: [
        Addon(name: "Extra Espresso Shot", price: 1.00),
        Addon(name: "Caramel Drizzle", price: 0.75),
        Addon(name: "Whipped Cream", price: 0.50),
      ],
    ),

    // Fries
    Food(
      name: "French Fries",
      descriptions: " Classic, crispy, golden fries",
      imagepath: "lib/images/fries/FrenchFries.png",
      price: 3.00,
      category: FoodCategory.fries,
      availableAddons: [
        Addon(name: "Truffle Oil", price: 2.00),
        Addon(name: "Garlic Parmesan", price: 1.50),
        Addon(name: "Cheese Sauce", price: 1.00),
      ],
    ),
    Food(
      name: "Hot Fries",
      descriptions: "Spicy, seasoned fries with a kick of heat",
      imagepath: "lib/images/fries/HotFries.png",
      price: 3.50,
      category: FoodCategory.fries,
      availableAddons: [
        Addon(name: "Truffle Oil", price: 2.00),
        Addon(name: "Garlic Parmesan", price: 1.50),
        Addon(name: "Cheese Sauce", price: 1.00),
      ],
    ),
    Food(
      name: "Potato Wedges",
      descriptions: "Thick-cut potato wedges, crispy on the outside and fluffy on the inside",
      imagepath: "lib/images/fries/PotatoWedges.png",
      price: 4.00,
      category: FoodCategory.fries,
      availableAddons: [
        Addon(name: "Truffle Oil", price: 2.00),
        Addon(name: "Garlic Parmesan", price: 1.50),
        Addon(name: "Cheese Sauce", price: 1.00),
      ],
    ),
    Food(
      name: "Short Fried Chicken",
      descriptions: "Bite-sized pieces of fried chicken, perfect for snacking or sharing",
      imagepath: "lib/images/fries/ShortFriedChicken.png",
      price: 7.00,
      category: FoodCategory.fries,
      availableAddons: [
        Addon(name: "Truffle Oil", price: 2.00),
        Addon(name: "Garlic Parmesan", price: 1.50),
        Addon(name: "Cheese Sauce", price: 1.00),
      ],
    ),
    Food(
      name: "Thai Fried Chicken",
      descriptions: "Crispy fried chicken marinated with Thai herbs and spices for an exotic flavor",
      imagepath: "lib/images/fries/ThaiFriedChicken.png",
      price: 10.00,
      category: FoodCategory.fries,
      availableAddons: [
        Addon(name: "Truffle Oil", price: 2.00),
        Addon(name: "Garlic Parmesan", price: 1.50),
        Addon(name: "Cheese Sauce", price: 1.00),
      ],
    ),

    // Sandwiches
    Food(
      name: "Beef Cheese Blast Sandwich",
      descriptions: "A hearty sandwich packed with juicy beef and melted cheese",
      imagepath: "lib/images/sandwich/BeefCheeseBlastSandwich.png",
      price: 9.00,
      category: FoodCategory.sandwich,
      availableAddons: [
        Addon(name: "Pesto Sauce", price: 1.50),
        Addon(name: "Pickles", price: 0.75),
        Addon(name: "Sliced Jalapeños", price: 0.75),
      ],
    ),
    Food(
      name: "Cheese Blast Sandwich",
      descriptions: "A rich and gooey sandwich overflowing with multiple types of melted cheese",
      imagepath: "lib/images/sandwich/CheeseBlastSandwich.png",
      price: 6.50,
      category: FoodCategory.sandwich,
      availableAddons: [
        Addon(name: "Pesto Sauce", price: 1.50),
        Addon(name: "Pickles", price: 0.75),
        Addon(name: "Sliced Jalapeños", price: 0.75),
      ],
    ),
    Food(
      name: "Falafel Sandwich",
      descriptions: "A pita or wrap filled with crispy falafel balls, fresh veggies, and tahini sauce",
      imagepath: "lib/images/sandwich/Falafel_Sandwich.png",
      price: 6.50,
      category: FoodCategory.sandwich,
      availableAddons: [
        Addon(name: "Pesto Sauce", price: 1.50),
        Addon(name: "Pickles", price: 0.75),
        Addon(name: "Sliced Jalapeños", price: 0.75),
      ],
    ),
    Food(
      name: "Grilled Smokey Sandwich",
      descriptions: "A savory sandwich with smoked meats and cheese, grilled to perfection",
      imagepath: "lib/images/sandwich/GrilledSmokeySandwich.png",
      price: 8.00,
      category: FoodCategory.sandwich,
      availableAddons: [
        Addon(name: "Pesto Sauce", price: 1.50),
        Addon(name: "Pickles", price: 0.75),
        Addon(name: "Sliced Jalapeños", price: 0.75),
      ],
    ),
    Food(
      name: "Panini Sandwich",
      descriptions: "A toasted sandwich filled with a variety of ingredients like cheese, meats, and vegetables",
      imagepath: "lib/images/sandwich/Panini_Sandwich.png",
      price: 7.50,
      category: FoodCategory.sandwich,
      availableAddons: [
        Addon(name: "Pesto Sauce", price: 1.50),
        Addon(name: "Pickles", price: 0.75),
        Addon(name: "Sliced Jalapeños", price: 0.75),
      ],
    ),

    // Smoothies
    Food(
      name: "Apple Smoothie",
      descriptions: "A crisp and refreshing smoothie with the naturally sweet taste of fresh apples",
      imagepath: "lib/images/smoothie/AppleSmoothie.png",
      price: 4.50,
      category: FoodCategory.smoothie,
      availableAddons: [
        Addon(name: "Greek Yogurt", price: 1.50),
        Addon(name: "Protein Powder", price: 1.50),
        Addon(name: "Chia Seeds", price: 1.00),
      ],
    ),
    Food(
      name: "Kiwi Smoothie",
      descriptions: "A tangy and invigorating smoothie bursting with the zesty flavor of fresh kiwi",
      imagepath: "lib/images/smoothie/KiwiSmoothie.png",
      price: 5.00,
      category: FoodCategory.smoothie,
      availableAddons: [
        Addon(name: "Greek Yogurt", price: 1.50),
        Addon(name: "Protein Powder", price: 1.50),
        Addon(name: "Chia Seeds", price: 1.00),
      ],
    ),
    Food(
      name: "Mango Smoothie",
      descriptions: "A creamy and tropical smoothie featuring the rich and luscious taste of mango",
      imagepath: "lib/images/smoothie/MangoSmoothie.png",
      price: 5.50,
      category: FoodCategory.smoothie,
      availableAddons: [
        Addon(name: "Greek Yogurt", price: 1.50),
        Addon(name: "Protein Powder", price: 1.50),
        Addon(name: "Chia Seeds", price: 1.00),
      ],
    ),
    Food(
      name: "Strawberry Smoothie",
      descriptions: "A deliciously sweet and tangy smoothie made with ripe strawberries",
      imagepath: "lib/images/smoothie/StrawberrySmoothie.png",
      price: 4.50,
      category: FoodCategory.smoothie,
      availableAddons: [
        Addon(name: "Greek Yogurt", price: 1.50),
        Addon(name: "Protein Powder", price: 1.50),
        Addon(name: "Chia Seeds", price: 1.00),
      ],
    ),
    Food(
      name: "Watermelon Smoothie",
      descriptions: "A refreshing and hydrating smoothie with the sweet, juicy flavor of watermelon",
      imagepath: "lib/images/smoothie/WatermelonSmoothie.png",
      price: 5,
      category: FoodCategory.smoothie,
      availableAddons: [
        Addon(name: "Greek Yogurt", price: 1.50),
        Addon(name: "Protein Powder", price: 1.50),
        Addon(name: "Chia Seeds", price: 1.00),
      ],
    ),
  ];

  // user cart
  final List<CartItem> _cart = [];

  //deliver address can be manually added
  String _deliveryAddress = "57/A Prottasha,Hashim Manjil";

  /*
   Getters
   */



  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

/*
   Operations
   */




// add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    //to check if the list or selected items are the same
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //to check if the food items are same
      bool isSameFood = item.food == food;


      bool isSameAddons =
      ListEquality().equals(item.selectedAddons,selectedAddons);

      return isSameFood && isSameAddons;
    });
    // if item already exist then increase the quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // otherwise add a new cart
    else{
      _cart.add(
        CartItem(food: food,
          selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();
  }
// remove from cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      }else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }
// total price

  double getTotalPrice(){
    double total = 0.0;

    for (CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;

      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;

  }
// total items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;
    for(CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

// clear cart
  void ClearCart(){
    _cart.clear();
    notifyListeners();
  }

  // update delivery address
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }


/*
   Helpers
   */


// generate a receipt
  String displayCartReceipt () {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt");
    receipt.writeln();

//format the date to include upto second only

    String formattedDate =
    DateFormat('yyyy-MM--dd HH:mm:ss').format(DateTime.now());

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("--------");

    for (final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${
          cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
            receipt.writeln(" Add-ons: ${_formatAddons(cartItem.selectedAddons)
            }");
      }
          receipt.writeln();
    }
    receipt.writeln("------------");
    receipt.writeln();
    receipt.writeln("Total items:  ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to : $deliveryAddress");

    return receipt.toString();


  }


// format double price tag
String _formatPrice(double price) {
  return "\$${price.toStringAsFixed(2)}";
}



// format addons string name
String _formatAddons(List<Addon> addons) {
  return addons.map((addons) =>  "${addons.name} (${_formatPrice
    (addons.price)})").join(", ");
}

}