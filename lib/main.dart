import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/presentation/screens/main_screen.dart';
import 'package:shopping_app/providers/main_screen_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainScreenNotifier())
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping App',
      home:  MainScreen()
    );
  }
}

