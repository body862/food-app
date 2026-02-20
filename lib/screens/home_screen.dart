import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/app_cubit.dart';
import '../cubit/app_state.dart';
import '../data/food_data.dart';
import '../widgets/food_item_list.dart';
import '../widgets/food_item_grid.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xfff5f5f5),
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Text(
                    "Food Delivery",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text("Search food",
                          style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                ),
                const SizedBox(height: 12),
                SizedBox(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: foods
                        .map(
                          (food) => Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: 180,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: DecorationImage(
                            image: AssetImage(food.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _switchBtn(context, "List View", !state.isGrid, () {
                      context.read<AppCubit>().toggleView(false);
                    }),
                    const SizedBox(width: 10),
                    _switchBtn(context, "Grid View", state.isGrid, () {
                      context.read<AppCubit>().toggleView(true);
                    }),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: state.isGrid
                      ? GridView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: foods.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 0.85,
                    ),
                    itemBuilder: (_, i) => FoodItemGrid(food: foods[i]),
                  )
                      : ListView.builder(
                    itemCount: foods.length,
                    itemBuilder: (_, i) => FoodItemList(food: foods[i]),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
  Widget _switchBtn(
      BuildContext context, String title, bool active, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
        decoration: BoxDecoration(
          color: active ? Colors.red : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          title,
          style: TextStyle(
            color: active ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}