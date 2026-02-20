import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/cart_model.dart';
import '../cubit/app_cubit.dart';
class CartItemWidget extends StatelessWidget {
  final CartModel item;
  const CartItemWidget({super.key, required this.item});
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AppCubit>();
    return ListTile(
      leading: Image.asset(item.food.image, width: 60),
      title: Text(item.food.name),
      subtitle: Text("\$${item.food.price}"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => cubit.removeOne(item.food),
            icon: const Icon(Icons.remove),
          ),
          Text("${item.quantity}"),
          IconButton(
            onPressed: () => cubit.addToCart(item.food),
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}