import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/food_model.dart';
import '../cubit/app_cubit.dart';
class DetailsScreen extends StatelessWidget {
  final FoodModel food;
  const DetailsScreen({super.key, required this.food});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            padding: const EdgeInsets.symmetric(vertical: 15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          onPressed: () {
            context.read<AppCubit>().addToCart(food);
            Navigator.pop(context);
          },
          child: const Text("Add To Cart"),
        ),
      ),
      body: ListView(
        children: [
          Image.asset(food.image, height: 260, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(food.name,
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold)),
                Text("\$${food.price}",
                    style: const TextStyle(
                        color: Colors.red,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _info(Icons.star, "${food.rate}"),
                    _info(Icons.local_fire_department, "${food.kcal} kcal"),
                  ],
                ),
                const SizedBox(height: 20),
                const Text("Description",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(food.description),
                const SizedBox(height: 20),
                const Text("Ingredients",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Wrap(
                  spacing: 8,
                  children: food.ingredients
                      .map((e) => Chip(label: Text(e)))
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _info(IconData icon, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.red),
          const SizedBox(height: 6),
          Text(value),
        ],
      ),
    );
  }
}