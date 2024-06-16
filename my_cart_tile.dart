import 'package:flutter/material.dart';
import 'package:fooddeliveryservice/components/my_quantity_selector.dart';
import 'package:fooddeliveryservice/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:fooddeliveryservice/models/cart_item.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) => Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(8),
        ),
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      cartItem.food.imagepath,
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          cartItem.food.name,
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '\$${cartItem.food.price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 14, color: Colors.green),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Text(
                                cartItem.food.descriptions,
                                style: TextStyle(fontSize: 14, color: Colors.grey),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              QuantitySelector(
                quantity: cartItem.quantity,
                food: cartItem.food,
                onIncrement: () {
                  restaurant.addToCart(cartItem.food, cartItem.selectedAddons);
                },
                onDecrement: () {
                  restaurant.removeFromCart(cartItem);
                },
              ),
              SizedBox(
                height: cartItem.selectedAddons.isEmpty ? 0 : 60,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 10, bottom: 10,right: 10),
                  children: cartItem.selectedAddons.map((addon) =>
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: FilterChip(
                            label: Row(
                              children: [
                                // Addon name
                                Text(addon.name),
                                SizedBox(width: 5), // Space between name and price
                                // Addon price
                                Text('\$${addon.price.toStringAsFixed(2)}'),
                              ],
                            ),
                            shape: StadiumBorder(
                              side: BorderSide(
                                color: Theme.of(context).colorScheme.primary,)
                            ),
                            onSelected: (value) {},
                            backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                            labelStyle: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
                            fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
