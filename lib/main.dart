import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:movieapp/router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://jjnppkexcwcnivkupbfi.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImpqbnBwa2V4Y3djbml2a3VwYmZpIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDY5NzAyMDMsImV4cCI6MjA2MjU0NjIwM30.oxgf-0nSxVKQQhkTqRHdTHBfpl54JWU3zz9-Emd8sGQ',
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Movies',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      ),
      routerConfig: route,
    );
  }
}
