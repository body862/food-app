import '../models/cart_model.dart';
import '../models/food_model.dart';
class CartController {
  static List<CartModel> cartItems = [];
  static void addToCart(FoodModel food) {
    int index = cartItems.indexWhere((e) => e.food.id == food.id);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(CartModel(food: food));
    }
  }
  static double getTotal() {
    double total = 0;
    for (var item in cartItems) {
      total += item.food.price * item.quantity;
    }
    return total;
  }
}
