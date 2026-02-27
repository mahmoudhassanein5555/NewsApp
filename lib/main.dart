
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_new_version/core/utils/theme_cubit.dart';
import 'package:news_app_new_version/core/utils/app_theme.dart';
import 'package:news_app_new_version/main_page.dart';

void main() {
  runApp(BlocProvider(create: (context) => ThemeCubit(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeMode>(
      builder: (context, themeMode) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'News App',
          theme: AppThemes.lightTheme, 
          darkTheme: AppThemes.darkTheme,
          themeMode: themeMode, 
          home: MainPage(),
        );
      },
    );
  }
}
