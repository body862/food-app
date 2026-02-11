import 'package:flutter/material.dart';
import '../controller/cart_controller.dart';
import '../widgets/cart_item_widget.dart';
class CartScreen extends StatefulWidget {
  const CartScreen({super.key});
  @override
  State<CartScreen> createState() => _CartScreenState();
}
class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double subtotal = CartController.getTotal();
    double delivery = 5;
    double taxes = 2.5;
    double total = subtotal + delivery + taxes;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: CartController.cartItems.length,
              itemBuilder: (_, i) => CartItemWidget(
                item: CartController.cartItems[i],
                refresh: () => setState(() {}),
              ),
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
                    offset: const Offset(0, -3))
              ],
            ),
            child: Column(
              children: [
                row("Subtotal", subtotal),
                row("Delivery Fee", delivery),
                row("Taxes", taxes),
                const Divider(),
                row("Total", total, isBold: true),
                const SizedBox(height: 12),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: () {},
                  child: const Text("Checkout"),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget row(String title, double value, {bool isBold = false}) {
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
