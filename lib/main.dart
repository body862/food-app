import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/app_cubit.dart';
import 'screens/main_layout.dart';
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AppCubit(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainLayout(),
      ),
    );
  }
}