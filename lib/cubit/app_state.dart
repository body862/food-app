import '../models/cart_model.dart';
import '../models/food_model.dart';
import '../models/cart_model.dart';
class AppState {
  final List<CartModel> cartItems;
  final bool isGrid;
  final List<FoodModel> favorites;
  AppState({
    this.cartItems = const [],
    this.isGrid = false,
    this.favorites = const [],
  });
  AppState copyWith({
    List<CartModel>? cartItems,
    bool? isGrid,
    List<FoodModel>? favorites,
  }) {
    return AppState(
      cartItems: cartItems ?? this.cartItems,
      isGrid: isGrid ?? this.isGrid,
      favorites: favorites ?? this.favorites,
    );
  }
}