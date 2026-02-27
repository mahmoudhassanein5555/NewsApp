// import 'package:flutter/material.dart';
// import 'package:news_app_new_version/main_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       // theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.deepPurple)),
//       theme: ThemeData.light(), // إعدادات الثيم الفاتح
//       darkTheme: ThemeData.dark(), // إعدادات الثيم الغامق
//       themeMode: themeMode,
//       // home: BlocProvider(create: (context) => BusinessCubit(),child: BusinessScreen()),
//       home: MainPage(),
//     );
//   }
// }
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
          title: 'News App',
          theme: AppThemes.lightTheme, // الثيم الفاتح بتاعنا
          darkTheme: AppThemes.darkTheme, // إعدادات الثيم الغامق
          themeMode: themeMode, // هنا الربط مع الكيوبت
          home: MainPage(),
        );
      },
    );
  }
}
