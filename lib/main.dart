import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movieapp/Screens/router.dart';
// import 'package:movieapp/Screens/no_result.dart';
// import 'package:movieapp/accounts_screen.dart';
// import 'package:movieapp/loding.dart';
// import 'package:movieapp/Screens/home_Screen.dart';
// import 'package:movieapp/Screens/movies_screen.dart';
// import 'package:movieapp/Screens/searchInput.dart';
// import 'package:movieapp/Screens/search_movie.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Movies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      routerConfig: route,
    );
  }
}
