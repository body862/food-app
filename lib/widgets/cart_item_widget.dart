import 'package:flutter/material.dart';
import '../models/cart_model.dart';
class CartItemWidget extends StatelessWidget {
  final CartModel item;
  final VoidCallback refresh;
  const CartItemWidget({
    super.key,
    required this.item,
    required this.refresh,
  });
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(item.food.image, width: 60),
      title: Text(item.food.name),
      subtitle: Text("\$${item.food.price}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              item.quantity--;
              refresh();
            },
            icon: const Icon(Icons.remove),
          ),
          Text("${item.quantity}"),
          IconButton(
            onPressed: () {
              item.quantity++;
              refresh();
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
