import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/food_model.dart';
import '../screens/details_screen.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
class FoodItemGrid extends StatelessWidget {
  final FoodModel food;
  const FoodItemGrid({super.key, required this.food});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        final isFav = context.read<AppCubit>().isFavorite(food.id);
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => DetailsScreen(food: food)),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(18)),
                        child: Image.asset(food.image, fit: BoxFit.cover,
                            width: double.infinity),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(food.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 14)),
                    const SizedBox(height: 4),
                    Text(
                      "\$${food.price}",
                      style: const TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: GestureDetector(
                    onTap: () =>
                        context.read<AppCubit>().toggleFavorite(food),
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isFav ? Icons.favorite : Icons.favorite_border,
                        color: Colors.red,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}