import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_version/features/home/presentation/view/business_screen.dart';
import 'package:news_app_new_version/features/home/presentation/view_model/home_cubit/business_news_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
      // home: BlocProvider(create: (context) => BusinessCubit(),child: BusinessScreen()),
      home: BusinessScreen(),
    );
  }
}
