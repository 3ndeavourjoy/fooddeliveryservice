import 'package:flutter/material.dart';
import 'package:fooddeliveryservice/components/my_button.dart';
import 'package:fooddeliveryservice/components/my_cart_tile.dart';
import 'package:fooddeliveryservice/models/restaurant.dart';
import 'package:fooddeliveryservice/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
      final userCart = restaurant.cart;

      return Scaffold(
        appBar: AppBar(
          title: const Text("Cart"),
          backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          actions: [
            IconButton(onPressed: () {
              showDialog(context: context, builder: (context) => AlertDialog(
                title: const Text("Are you sure want to clear the cart?"),
                actions: [
                  //cancel button
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),),

                  //yes button
                  TextButton(
                    onPressed: () {Navigator.pop(context);
                      restaurant.ClearCart();
                      },
                    child: Text("Yes"),),
                ],
               ),
              );
            },
            icon: const Icon(Icons.delete),
            )
          ],
        ),
        body: Column(
          children: [
            // list of cart

            Expanded(
              child: Column(
                children: [
              userCart.isEmpty
              ? const Expanded(
              child: Center(
              child: const Text ("Cart is Empty..."),
                   ),
                  ):
                  Expanded(
                  child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          //individual cart item
                          final cartItem = userCart[index];

                          //return cart tile ui
                        return MyCartTile(cartItem: cartItem);
                      },
                     ),
                    ),
                  ],
                ),
              ),
            // button to pay
            MyButton(onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => const PaymentPage(),
              ),
             ),
                text: "Go To Checkout",
            ),
            const SizedBox(height: 25),
          ],
        ),



        );
      },
    );
  }
}
