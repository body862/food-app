class FoodModel {
  final String id;
  final String name;
  final String image;
  final String description;
  final double price;
  final double rate;
  final int kcal;
  final List<String> ingredients;
  FoodModel({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.rate,
    required this.kcal,
    required this.ingredients,
  });
}
