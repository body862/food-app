import 'food_model.dart';
class CartModel {
  final FoodModel food;
  final int quantity;
  const CartModel({required this.food, this.quantity = 1});
}