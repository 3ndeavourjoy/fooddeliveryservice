import 'package:flutter/material.dart';
import 'package:fooddeliveryservice/models/food.dart';

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;


  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [

                //food text description
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food.name),
                        Text('\$' + food.price.toString(),
                          style: TextStyle(color:
                          Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        Text(food.descriptions,
                        style: TextStyle(color:
                        Theme.of(context).colorScheme.inversePrimary,
                          ),
                        ),
                      ],
                    ),
                ),
                const SizedBox(width: 15,),

                //food images
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                    child: Image.asset(food.imagepath,height: 120,
                    )
                ),
              ],
            ),
          ),
        ),
        //divider
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        )


      ],
    );
  }
}
