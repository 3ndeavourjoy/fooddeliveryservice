class Food{
  final String name;
  final String descriptions;
  final String imagepath;
  final double price;
  final FoodCategory category;
  List<Addon> availableAddons;

  Food({
    required this.name,
    required this.descriptions,
    required this.imagepath,
    required this.price,
    required this.category,
    required this.availableAddons,
    });

}
// category of food

enum FoodCategory {
  burgers,
  sandwich,
  fries,
  coldcoffee,
  smoothie,
}

class Addon{
  String name;
  double price;

  Addon({
    required this.name,
    required this.price,
});
}