import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cart_model.dart';
import '../models/food_model.dart';
import 'app_state.dart';
class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppState());
  void addToCart(FoodModel food) {
    final items = List<CartModel>.from(state.cartItems);
    final index = items.indexWhere((e) => e.food.id == food.id);
    if (index != -1) {
      items[index] = CartModel(
        food: items[index].food,
        quantity: items[index].quantity + 1,
      );
    } else {
      items.add(CartModel(food: food));
    }
    emit(state.copyWith(cartItems: items));
  }
  void removeOne(FoodModel food) {
    final items = List<CartModel>.from(state.cartItems);
    final index = items.indexWhere((e) => e.food.id == food.id);
    if (index != -1 && items[index].quantity > 0) {
      items[index] = CartModel(
        food: items[index].food,
        quantity: items[index].quantity - 1,
      );
    }
    emit(state.copyWith(cartItems: items));
  }
  double getSubtotal() {
    return state.cartItems.fold(
      0,
          (sum, item) => sum + item.food.price * item.quantity,
    );
  }
  void toggleView(bool grid) {
    emit(state.copyWith(isGrid: grid));
  }
  void toggleFavorite(FoodModel food) {
    final favs = List<FoodModel>.from(state.favorites);
    final exists = favs.any((e) => e.id == food.id);
    if (exists) {
      favs.removeWhere((e) => e.id == food.id);
    } else {
      favs.add(food);
    }
    emit(state.copyWith(favorites: favs));
  }
  bool isFavorite(String foodId) {
    return state.favorites.any((e) => e.id == foodId);
  }
}