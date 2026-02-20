import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../widgets/cart_item_widget.dart';
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final cubit = context.read<AppCubit>();
        final subtotal = cubit.getSubtotal();
        const delivery = 5.0;
        const taxes = 2.5;
        final total = subtotal + delivery + taxes;
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: state.cartItems.isEmpty
                    ? const Center(
                  child: Text(
                    "Your cart is empty",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                )
                    : ListView.builder(
                  itemCount: state.cartItems.length,
                  itemBuilder: (_, i) =>
                      CartItemWidget(item: state.cartItems[i]),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 8,
                      offset: const Offset(0, -3),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _row("Subtotal", subtotal),
                    _row("Delivery Fee", delivery),
                    _row("Taxes", taxes),
                    const Divider(),
                    _row("Total", total, isBold: true),
                    const SizedBox(height: 12),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        minimumSize: const Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      onPressed: state.cartItems.isEmpty
                          ? null
                          : () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Order placed successfully!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text("Checkout"),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
  Widget _row(String title, double value, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text("\$${value.toStringAsFixed(2)}",
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }
}